#!/bin/bash
# set -e
DEVCDN="geexxx"
ZIPPATH='cwm_flash_zip'
rm -f "$ZIPPATH/boot.img"
make ARCH=arm -j10 zImage
rm -rf kernel_install
cp arch/arm/boot/zImage "$ZIPPATH/tools/"
VERSION=$(cat Makefile | grep "EXTRAVERSION = -" | sed 's/EXTRAVERSION = -//')
rm -f "arch/arm/boot/testing$VERSION-$DEVCDN.zip"
cd "$ZIPPATH"
zip -r "../arch/arm/boot/testing$VERSION-$DEVCDN.zip" ./
cd ..
mkdir -p "../builds$DEVCDN/"
mv "arch/arm/boot/testing$VERSION-$DEVCDN.zip" "../builds$DEVCDN/"
exit 0
