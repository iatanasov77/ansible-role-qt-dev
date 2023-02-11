#!/bin/bash

##########################################################################
# Manual How to Build: https://wiki.qt.io/Building_Qt_5_from_Git/bg
##########################################################################

cd "{{toolsdir}}/qt-build/"
rm -rf ./*
rm -rf "{{toolsdir}}/qt-package/*"

#./init-repository --module-subset=default,-qtwebengine --branch
../qt5-src/configure -prefix "{{toolsdir}}/qt-package/" \
	#-recheck-all \
	-release -opensource -confirm-license \
	-make libs -make tools \
	-opengl desktop -platform linux-g++-64 \
	-nomake tests -nomake examples \
	-sql-mysql \
	-feature-library \
	-skip qtwebengine -skip qtdocgallery -skip qtlocation
	
make -j$(nproc)
make install
