#!/bin/sh

set -e
set -v

sudo add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu vivid main universe"
sudo apt-get update
sudo apt-get install patchelf
sudo apt-get install libgstreamer-plugins-base0.10-0
sudo apt-get install libpulse-mainloop-glib0

./install-qt-5.9

cat ./qt-5.9.env
. ./qt-5.9.env

ls Qt
ls Qt/5.9
ls Qt/5.9/gcc_64

which qmake

./install-linuxdeployqt.sh
./build-app.sh

find $BUILDDIR
cd $SRCDIR
ls
ldd $BUILDDIR/SparkQML

find $BUILDDIR \( -name "moc_*" -or -name "*.o" -or -name "qrc_*" -or -name "Makefile*" -or -name "*.a" \) -exec rm {} \;

echo $SRCDIR
LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/:/usr/lib/x86_64-linux-gnu/pulseaudio linuxdeployqt $BUILDDIR/SparkQML -bundle-non-qt-libs -appimage -qmldir=$SRCDIR

find $BUILDDIR

ls
mkdir -p $ROOTDIR/artifacts
cp Application-x86_64.AppImage $ROOTDIR/artifacts/SparkQML.AppImage
md5sum $ROOTDIR/artifacts/SparkQML.AppImage
