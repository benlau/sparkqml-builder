#!/bin/sh

set -e
set -v

./qtci/env/qt-5.7

source qt-5.7.env

./build-app.sh
