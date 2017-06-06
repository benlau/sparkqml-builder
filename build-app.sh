#!/bin/sh
# This script is shared between OSX and Linux build

set -v
set -e

git clone https://github.com/benlau/sparkqml.git
(cd $SRCDIR;qpm install)
mkdir -p build/sparkqml
cd build/sparkqml
qmake $SRCDIR/sparkqml.pro
make
make INSTALL_ROOT=${INSTALLDIR} install
find ${INSTALLDIR}
ls
