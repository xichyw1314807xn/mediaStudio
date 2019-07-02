#!/bin/bash
#make clean
export NDK=/home/yangcongwen/android-ndk-r17c
export SYSROOT=$NDK/platforms/android-19/arch-arm/
export TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-




#NDK=/home/yangcongwen/android-ndk-r15c/
#PLATFORM=$NDK/platforms/android-19/arch-arm/
PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
#CC=$PREBUILT/bin/arm-linux-androideabi-gcc

export CPU=arm
export PREFIX=$(pwd)/android/$CPU
export ADDI_CFLAGS="-marm"
export cflags="-I$NDK/sysroot/usr/include/arm-linux-androideabi -isysroot $NDK/sysroot -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a -D__ANDROID_API__=21 -g -DANDROID -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -mthumb -Wa,--noexecstack -Wformat -Werror=format-security -O0 -fPIC"

function build_one
{
	./configure \
	--prefix=android/arm \
	--arch=arm \
	--disable-doc \
	--enable-shared \
	--disable-static \
	--disable-symver \
	--enable-cross-compile \
	--enable-runtime-cpudetect \
	--enable-gpl \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-doc \
	--disable-symver \
	--disable-x86asm \
	--disable-stripping \
	--nm=$PREBUILT/bin/arm-linux-androideabi-nm \
	--cross-prefix=$TOOLCHAIN \
	--target-os=linux \
	--enable-cross-compile \
	--sysroot=$SYSROOT \
	--extra-cflags="$cflags" \
	--extra-ldflags="$ADDI_LDFLAGS"
}
build_one && make -j8 && make install
