#!/bin/sh

set -v
set -e

time ./install-qt-5.9-osx

source ./qt-5.9.0-osx.env

./build-app.sh

APP=build/sparkqml/SparkQML.app
macdeployqt $APP -qmldir=$SRCDIR
npm install -g appdmg
appdmg dmg.json SparkQML.dmg
cp SparkQML.dmg $ROOTDIR/artifacts
md5 SparkQML.dmg 
ls $ROOTDIR/artifacts
