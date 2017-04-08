#!/bin/sh

set -v
set -e

./install-qt-5.7-osx

source ./qt-5.7.0-osx.env

./build-app.sh

APP=build/sparkqml/SparkQML.app
macdeployqt $APP
npm install -g appdmg
appdmg dmg.json SparkQML.dmg

