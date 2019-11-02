#!/bin/bash

OPENWRT_SDK=/home/build/openwrt

cd $OPENWRT_SDK

./scripts/feeds update -a
make menuconfig

if [ ! -f .config ]; then
  echo ".config from make menuconfig doesn't exists"
  exit 1;
fi

GCCV="5.3.0"
ARCH="mips"
ARCH_SUFFIX="_34kc"
BOARD="ar71xx"
LIBC="musl-1.1.14"

DIR_SUFFIX=$LIBC
TARGET_DIR_NAME=target-${ARCH}${ARCH_SUFFIX}_${DIR_SUFFIX}
TOOLCHAIN_DIR_NAME=toolchain-${ARCH}${ARCH_SUFFIX}_gcc-${GCCV}_${DIR_SUFFIX}

export TOOLCHAIN_DIR=$OPENWRT_SDK/staging_dir/$TOOLCHAIN_DIR_NAME
export STAGING_DIR=$OPENWRT_SDK/staging_dir/$TARGET_DIR_NAME
export STAGING_DIR_ROOT=$STAGING_DIR/root-$BOARD
export STAGING_DIR_HOST=$OPENWRT_SDK/staging_dir/host
export STAGING_DIR_HOSTPKG=$OPENWRT_SDK/staging_dir/hostpkg
export PATH=$TOOLCHAIN_DIR/bin:$STAGING_DIR_HOST/bin:$STAGING_DIR_HOSTPKG/bin:$PATH        
export CROSS_COMPILE_TOOLCHAIN_PREFIX=$ARCH-openwrt-linux-$LIBC

/home/build/sdk/$@