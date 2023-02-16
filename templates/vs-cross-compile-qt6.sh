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
	-skip qtcharts -skip qtdoc \
	-skip qtremoteobjects -skip qtserialbus -skip qtwebchannel \
	-skip qtwebview -skip qtandroidextras -skip qtconnectivity \
	-skip qtgamepad -skip qtmacextras -skip qtpurchasing -skip qtscript \
	-skip qttranslations -skip qtwinextras \
	-skip qtdatavis3d \
	-skip qtquickcontrols -skip qtscxml \
	-skip qtvirtualkeyboard -skip qtwebglplugin \
	-skip qtimageformats -skip qtnetworkauth -skip qtquickcontrols2 \
	-skip qtsensors -skip qtwayland \
	-no-feature-thread \
	-qt-host-path "{{toolsdir}}/qt-{{vs_qt_version_full}}/x86_64/" \
	-- -DCMAKE_TOOLCHAIN_FILE=/usr/local/vs_cmake/mingw-w64-x86_64.cmake # -DQT_BUILD_TOOLS_WHEN_CROSSCOMPILING=ON

cmake --build . --verbose
cmake --install . --verbose
