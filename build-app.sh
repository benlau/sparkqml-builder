#!/bin/sh

git clone https://github.com/benlau/sparkqml.git
cd sparkqml/app/sparkqml
qpm install
qmake 
make
ls
