#!/bin/sh

set -v
set -e

./install-qt-5.9-osx

source ./qt-5.9.0-osx.env

./build-app.sh

APP=build/sparkqml/SparkQML.app
macdeployqt $APP
npm install -g appdmg
appdmg dmg.json SparkQML.dmg
cp SparkQML.dmg $ROOTDIR/artifacts
md5 SparkQML.dmg 
ls $ROOTDIR/artifacts
