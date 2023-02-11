#!/bin/bash

##########################################################################
# Manual How to Build: https://wiki.qt.io/Building_Qt_5_from_Git/bg
##########################################################################

cd "{{toolsdir}}/qt-build/"
rm -rf ./*
rm -rf "{{toolsdir}}/qt-package/*"

../qt5-src/configure -prefix "{{toolsdir}}/qt-package/" \
	-release -opensource -confirm-license -make libs -make tools \
	-opengl desktop -platform linux-g++-64 \
	-nomake tests -nomake examples \
	-sql-mysql -feature-library \
	-skip qtwebengine -skip qtdocgallery -skip qtlocation

cmake --build . --verbose
cmake --install . --verbose
