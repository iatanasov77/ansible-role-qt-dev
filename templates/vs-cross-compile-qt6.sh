#!/bin/bash

cd "{{toolsdir}}/qt-build/build/"
rm -rf ./*
rm -rf "{{toolsdir}}/qt-build/package/*"

../../qt5-src/configure -prefix "{{toolsdir}}/qt-build/package" \
	-release -opensource -confirm-license -make libs -make tools \
	-opengl desktop -xplatform win32-g++ \
	-nomake tests -nomake examples \
	-skip qtwebengine -skip qtdocgallery -skip qtlocation \
	-skip qtwinextras -skip qtx11extras -skip qtmacextras -skip qtandroidextras \
	-skip qt3d -skip qtquick3d -skip qtquick3dphysics -skip qtcanvas3d -skip qtgraphicaleffects \
	-skip qtdeclarative \
	-skip qtdoc -skip qtlottie -skip qtmqtt -skip qtopcua -skip qtscxml -skip qtvirtualkeyboard \
	-skip qtwebview \
	-skip qtquicktimeline -skip qtquickeffectmaker \
	-skip qtwebsockets -skip qtactiveqt \
	-skip qtcharts -skip qtremoteobjects -skip qtserialbus -skip qtwebchannel \
	-skip qtwebview -skip qtconnectivity \
	-skip qtgamepad -skip qtpurchasing -skip qtscript \
	-skip qttranslations -skip qtdatavis3d \
	-skip qtquickcontrols -skip qtwebglplugin \
	-skip qtimageformats -skip qtnetworkauth -skip qtquickcontrols2 \
	-skip qtsensors -skip qtwayland \
	-skip qtsvg -skip qtshadertools -skip qtmultimedia \
	-no-feature-thread \
	-no-feature-networklistmanager \
	-qt-host-path "{{toolsdir}}/qt-{{vs_qt_version_full}}/x86_64/" \
	-- -DCMAKE_TOOLCHAIN_FILE=/usr/local/vs_cmake/mingw-w64-x86_64.cmake # -DQT_BUILD_TOOLS_WHEN_CROSSCOMPILING=ON

cmake --build . --verbose
cmake --install . --verbose
