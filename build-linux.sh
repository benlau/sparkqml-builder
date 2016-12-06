#!/bin/sh

set -e
set -v

./qtci/env/qt-5.7

cat ./qt-5.7.env
. ./qt-5.7.env

./build-app.sh
