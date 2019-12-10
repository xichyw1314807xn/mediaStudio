#!/bin/bash

# NDK的路径，根据自己的安装位置进行设置
NDK=/home/yangcongwen/android-ndk-r17c

# 编译针对的平台，可以根据自己的需求进行设置
# 这里选择最低支持android-14, arm架构，生成的so库是放在
# libs/armeabi文件夹下的，若针对x86架构，要选择arch-x86
SYSROOT=$NDK/platforms/android-19/arch-arm


# 工具链的路径，根据编译的平台不同而不同
# arm-linux-androideabi-4.9与上面设置的PLATFORM对应，4.9为工具的版本号，
# 根据自己安装的NDK版本来确定，一般使用最新的版本
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64

ARCH=arm
TARGETOS=android
PREFIX=$(pwd)/$TARGETOS/$ARCH
PREFIX1=$(pwd)
ADDITIONAL_CONFIGURE_FLAG=

./configure \
    --prefix=$PREFIX \
    --enable-shared \
    --disable-static \
    --disable-doc \
    --disable-programs \
    --enable-small \
    --disable-avdevice \
    --disable-devices \
    --disable-protocols \
    --enable-protocol=file \
    --enable-cross-compile \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --sysroot=$PLATFORM \
    --extra-cflags="-Os -fpic" \
    --extra-ldflags="$ADDI_LDFLAGS" \
    --arch="$ARCH" \
    --target-os="$TARGETOS" \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --extra-cflags="-I$NDK/sysroot/usr/include/arm-linux-androideabi -isysroot $NDK/sysroot -fPIC -DANDROID -D__thumb__ -mthumb -Wno-deprecated -Wfatal-errors -mfloat-abi=softfp -marm -march=armv7-a" \
    --enable-neon

make clean && make -j 8 &&make install
