#!/bin/sh

set -v
set -e

./install-qt-5.7-osx

source ./qt-5.7-osx.env

./build-app.sh
