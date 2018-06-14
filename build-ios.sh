#!/bin/bash
# (C) Copyright 2018 Chris Jones
# CREDIT: Comsecuris UG https://github.com/Comsecuris/ios_dropbear
#
# Usage:
# NOTE: run this scrpit for project root!
# 1) downlod jtool `http://newosxbook.com/tools/jtool.tar`
# 2) put `jtool` in PATH
# 3) `xcodebuild -showsdks` to list available SDK's and select desired SDK
# 4) `./build-ios.sh` to build neofetch for iOS

# path to jtool
JTOOL="$HOME/.local/bin/jtool"

# ARCH, ie. `arm64` `armv7`
ARCH="armv7"

# SDK, ie. iphoneos11.4
SDK="iphoneos9.3"

SYSROOT="$(xcrun -v --sdk $SDK --show-sdk-path)"
CC="$(xcrun -f --sdk $SDK clang)"
CFLAGS="-arch $ARCH --sysroot=$SYSROOT"
LDFLAGS="-arch $ARCH --sysroot=$SYSROOT"

export CC CFLAGS LDFLAGS

make CC="$CC" PREFIX=$(pwd)/build install

# cd build/bin

# for i in neofetch; do
#   $JTOOL --sign $i
#   mv out.bin $i
#   $JTOOL --sig $i
# done

