#!/bin/sh

wget -c https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage
mv linuxdeployqt-continuous-x86_64.AppImage linuxdeployqt
chmod u+x linuxdeployqt
cp linuxdeployqt/linuxdeployqt $BINDIR

