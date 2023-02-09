#!/bin/bash

cd "{{toolsdir}}/qt-build/"
rm -rf ./*
rm -rf "{{toolsdir}}/qt-package/*"

../qt5-src/configure -prefix "{{toolsdir}}/qt-package" \
	-release -opensource -confirm-license -make libs -make tools \
	-opengl desktop -xplatform win32-g++ \
	-nomake tests -nomake examples \
	-skip qtwebengine -skip qtdocgallery -skip qtlocation \
	-skip qtx11extras \
	-skip qt3d -skip qtquick3d -skip qtquick3dphysics -skip qtcanvas3d -skip qtgraphicaleffects -skip qtmultimedia \
	-skip qtwebsockets -skip qtactiveqt \
	-qt-host-path /home/vagrant/tools/qt-6.4.2-x86_64 \
	-- -DCMAKE_TOOLCHAIN_FILE=/usr/local/vs_cmake/mingw-w64-x86_64.cmake

cmake --build . --verbose
cmake --install . --verbose
