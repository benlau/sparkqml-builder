#!/bin/sh

set -v
set -e

./install-qt-5.7-osx

source ./qt-5.7.0-osx.env

./build-app.sh

pwd
APP=`find . -name '*.app'`
echo $APP
macdeployqt $APP
npm install -g appdmg
appdmg dmg.json SparkQML.dmg

