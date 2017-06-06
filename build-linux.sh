#!/bin/sh

set -e
set -v

sudo add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu vivid main universe"
sudo apt-get update
sudo apt-get install patchelf
sudo apt-get install libgstreamer-plugins-base0.10-0

ROOTDIR=`pwd`
install-qt-5.9

cat ./qt-5.9.env
source ./qt-5.9.env

which qmake

./install-linuxdeployqt.sh
./build-app.sh

cd $BUILDDIR
cd $SRCDIR
ls
ldd $BUILDDIR/SparkQML

find $BUILDDIR \( -name "moc_*" -or -name "*.o" -or -name "qrc_*" -or -name "Makefile*" -or -name "*.a" \) -exec rm {} \;

LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/:/usr/lib/x86_64-linux-gnu/pulseaudio linuxdeployqt $BUILDDIR/SparkQML -bundle-non-qt-libs -appimage -qmldir=$SRCDIR

ls
mkdir -p $ROOTDIR/artifacts
cp Application-x86_64.AppImage $ROOTDIR/artifacts/SparkQML.AppImage
md5sum $ROOTDIR/artifacts/SparkQML.AppImage
