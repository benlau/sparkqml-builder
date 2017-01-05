#!/bin/sh

export SRCDIR=`pwd`/sparkqml/app/sparkqml
git clone https://github.com/benlau/sparkqml.git
(cd $SRCDIR;qpm install)
mkdir -p build/sparkqml
cd build/sparkqml
qmake $SRCDIR/sparkqml.pro
make
ls
