#!/bin/sh

set -e
set -v

sudo add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu vivid main universe"
sudo apt-get update
sudo apt-get install patchelf

./qtci/recipes/qt-5.7

cat ./qt-5.7.env
. ./qt-5.7.env

which qmake

./build-linuxdeployqt.sh
./build-app.sh

cd $SRCDIR
ldd $BUILDDIR/SparkQML
dpkg -L libpulse0

LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/pulseaudio linuxdeployqt $BUILDDIR/SparkQML -appimage -qmldir=$SRCDIR
