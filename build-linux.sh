#!/bin/sh

set -e
set -v

sudo apt-get install patchelf

./qtci/env/qt-5.7

cat ./qt-5.7.env
. ./qt-5.7.env

./build-linuxdeployqt.sh
./build-app.sh

