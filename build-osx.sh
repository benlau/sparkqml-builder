#!/bin/sh

set -v
set -e

./install-qt-5.7-osx

source ./qt-5.7.0-osx.env

./build-app.sh

macdeployqt sparkqml/app/sparkqml/SparkQML.app
npm install -g appdmg
appdmg dmg.json SparkQML.dmg

