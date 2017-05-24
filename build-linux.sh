#!/bin/sh

set -e
set -v

sudo add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu vivid main universe"
sudo apt-get update
sudo apt-get install patchelf

ROOTDIR=`pwd`
./qtci/recipes/qt-5.7

cat ./qt-5.7.env
. ./qt-5.7.env

which qmake

find . -name "libgstaudiodecoder.so"


#./build-linuxdeployqt.sh
./install-linuxdeployqt.sh
./build-app.sh

cd $SRCDIR
ls
ldd $BUILDDIR/SparkQML

dpkg -L libgstreamer-plugins-base1.0-0
ls /usr/lib/x86_64-linux-gnu/libgstaudio-*


LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/:/usr/lib/x86_64-linux-gnu/pulseaudio linuxdeployqt $BUILDDIR/SparkQML -verbose=2 -bundle-non-qt-libs -appimage -qmldir=$SRCDIR
