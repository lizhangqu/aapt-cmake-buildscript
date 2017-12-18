# aapt cmake buildscript

查看manifest仓库请转移到 [https://github.com/lizhangqu/aapt-repo-manifest](https://github.com/lizhangqu/aapt-repo-manifest)

## for mac

创建大小写敏感磁盘

```
hdiutil create -volname "aapt" -type SPARSE -fs 'Case-sensitive Journaled HFS+' -size 10g aapt.dmg
```

挂载

```
hdiutil attach aapt.dmg.sparseimage -mountpoint /Volumes/aapt
```

卸载

```
hdiutil detach /Volumes/aapt
```

## for linux(Ubuntu 16.0.4)

```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install openjdk-8-jdk
sudo apt-get install cmake
sudo apt-get install clang
sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip
```

## for windows(Ubuntu 16.0.4下使用MinGw进行交叉编译)

当前windows可执行文件和动态库的版本只能在linux(Ubuntu 16.0.4)上进行交叉编译产生，需要安装MinGw

```
sudo apt-get install mingw-w64
```

安装完成后，mingw-gcc和mingw-g++默认使用的线程模型是win32的，但是我们需要使用posix的线程模型，因此分别执行以下命令，将工具链指向带-posix后缀的工具链

```
sudo update-alternatives --config x86_64-w64-mingw32-gcc
sudo update-alternatives --config x86_64-w64-mingw32-g++
sudo update-alternatives --config x86_64-w64-mingw32-gfortran
sudo update-alternatives --config x86_64-w64-mingw32-gnat

sudo update-alternatives --config i686-w64-mingw32-gcc
sudo update-alternatives --config i686-w64-mingw32-g++
sudo update-alternatives --config i686-w64-mingw32-gfortran
sudo update-alternatives --config i686-w64-mingw32-gnat
```

如果交叉编译构建过程中发生了如下错误

```
error: ‘_Atomic’ does not name a type
 typedef _Atomic _Bool atomic_bool;
```

请将system/core/libcutils/include/cutils/atomic.h头文件中的#include <stdatomic.h>部分

改为

```
#if defined(_WIN32)
    #ifdef __cplusplus
    #include <atomic>
    using namespace std;
    #else
    #include <stdatomic.h>
    #endif
#else
    #include <stdatomic.h>
#endif
```

## 构建

安装repo

```
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```

初始化repo项目

```
#进入工作目录
cd /Volumes/aapt
#如果存在repo bundle下载不下来的情况，请使用下面的命令进行手动clone
#git clone http://mirrors.ustc.edu.cn/aosp/git-repo.git/ .repo/repo
#初始化并同步源码树，约3G
repo init -u git@github.com:lizhangqu/aapt-repo-manifest.git -b android_8.1.0_r1
repo sync -j8
```

执行构建，构建过程中发生错误请自行根据提示安装对应的依赖库，下面是mac和linux的构建步骤

```
#进入工作目录
cd /Volumes/aapt
#使用cmake生成构建文件，并最小化编译产物
cmake -H"./" -B"./build-cmake" -DCMAKE_BUILD_TYPE=MinSizeRel
#编译aapt
cmake --build "./build-cmake" --target aapt -- -j 8
#生成aapt2所需的头文件
cmake --build "./build-cmake" --target protobuffer_h -- -j 8
#编译aapt2
cmake --build "./build-cmake" --target aapt2 -- -j 8
#编译aapt2_jni
cmake --build "./build-cmake" --target aapt2_jni -- -j 8
```

交叉编译时，如果需要指定交叉编译工具链的路径，则使用如下命令传递对应参数

```
cmake -H"./" -B"./build-cmake" -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_TOOLCHAIN_FILE=windows.toolchain.cmake
```

windows可执行文件需要在Ubuntu 16.0.4下进行交叉编译，进行交叉编译前，需要将system/core/libcutils/include/cutils/atomic.h头文件中的#include <stdatomic.h>部分修改为

```
#if defined(_WIN32)
    #ifdef __cplusplus
    #include <atomic>
    using namespace std;
    #else
    #include <stdatomic.h>
    #endif
#else
    #include <stdatomic.h>
#endif
```

原因是引用的头文件stdatomic.h不是标准的c++部分，而clang可以支持兼容掉这部分，但是交叉编译工具链MinGW g++不支持，因此需要引用标准的C++中的atomic头文件。

并且交叉编译工具链不支持在linux下执行windows的可执行文件，因此aapt2需要的protobuffer头文件需要在linux用linux可执行文件生成，具体的完整流程如下

```
#进入工作目录
cd /Volumes/aapt
#使用cmake生成linux构建文件，并最小化编译产物
cmake -H"./" -B"./build-cmake-linux" -DCMAKE_BUILD_TYPE=MinSizeRel
#使用linux环境生成aapt2所需的头文件
cmake --build "./build-cmake" --target protobuffer_h -- -j 8

#使用cmake生成windows交叉编译构建文件，并最小化编译产物
cmake -H"./" -B"./build-cmake-windows" -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_TOOLCHAIN_FILE=windows.toolchain.cmake

#编译aapt
cmake --build "./build-cmake-windows" --target aapt -- -j 8
#编译aapt2
cmake --build "./build-cmake-windows" --target aapt2 -- -j 8
#编译aapt2_jni
cmake --build "./build-cmake-windows" --target aapt2_jni -- -j 8
#最终windows下的可执行文件和动态库生成都位于build-cmake-windows目录下
```

如果需要编译32位的可执行文件，在生产cmake文件的时候，添加-DUSE_32BITS=1参数，如

```
#linux或者mac
cmake -H"./" -B"./build-cmake-unix-x86" -DCMAKE_BUILD_TYPE=MinSizeRel -DUSE_32BITS=1
#windows交叉编译
cmake -H"./" -B"./build-cmake-windows-x86" -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_TOOLCHAIN_FILE=windows.toolchain.cmake -DUSE_32BITS=1
```
