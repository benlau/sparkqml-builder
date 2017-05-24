#!/bin/bash

set -e
set -v

export LINUXDEPLOYQT_BUILDDIR=`pwd`/build/linuxdeployqt
mkdir -p $LINUXDEPLOYQT_BUILDDIR
cd $LINUXDEPLOYQT_BUILDDIR
git clone https://github.com/probonopd/linuxdeployqt.git
cd linuxdeployqt
which qmake
qmake
make
cp linuxdeployqt/linuxdeployqt $BINDIR
