#!/bin/bash

cd "{{toolsdir}}/qt-build/build/"
rm -rf ./*
rm -rf "{{toolsdir}}/qt-build/package/*"

../../qt5-src/configure -prefix "{{toolsdir}}/qt-build/package" \
	-release -opensource -confirm-license -make libs -make tools \
	-opengl desktop -xplatform win32-g++ \
	-nomake tests -nomake examples \
	-skip qtwebengine -skip qtdocgallery -skip qtlocation \
	-skip qtx11extras \
	-skip qt3d -skip qtquick3d -skip qtquick3dphysics -skip qtcanvas3d -skip qtgraphicaleffects -skip qtmultimedia \
	-skip qtwebsockets -skip qtactiveqt \
	#-qt-host-path "{{toolsdir}}/qt-build/host-target" \
	-no-feature-thread
	-- -DCMAKE_TOOLCHAIN_FILE=/usr/local/vs_cmake/mingw-w64-x86_64.cmake

cmake --build . --verbose
cmake --install . --verbose
