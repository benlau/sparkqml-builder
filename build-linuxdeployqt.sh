#!/bin/bash

set -e 
set -v

export BUILDDIR=`pwd`/build/linuxdeployqt
mkdir $BUILDDIR
cd $BUILDDIR
git clone https://github.com/probonopd/linuxdeployqt.git
qmake
make
cp linuxdeployqt/linuxdeployqt /usr/local/bin
