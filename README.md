# aapt cmake buildscript

查看manifest仓库请转移到 [https://github.com/lizhangqu/aapt-repo](https://github.com/lizhangqu/aapt-repo)

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

## for windows

当前windows的版本只能在linux(Ubuntu 16.0.4)上进行交叉编译产生，需要安装MinGw

```
sudo apt-get install mingw-w64
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
repo init -u git@github.com:lizhangqu/aapt-repo.git
repo sync -j8
```

执行构建，构建过程中发生错误请自行根据提示安装对应的依赖库

```
#进入工作目录
cd /Volumes/aapt
#使用cmake生产构建文件，并最小化编译产物
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

交叉编译时，指定交叉编译工具链的路径

```
cmake -H"./" -B"./build-cmake" -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_TOOLCHAIN_FILE=./windows.toolchain.cmake
```
