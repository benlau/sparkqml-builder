#!/bin/sh

set -e
set -v

wget -c https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage
mv linuxdeployqt-continuous-x86_64.AppImage linuxdeployqt
chmod u+x linuxdeployqt
./linuxdeployqt
cp linuxdeployqt $BINDIR

