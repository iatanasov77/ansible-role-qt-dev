#!/bin/bash

cd "{{toolsdir}}/qt5-src/"
./init-repository --module-subset=default,-qtwebengine --branch
# -sql-mysql
./configure -prefix "{{toolsdir}}/qt-{{qt_version_full}}/mingw_64/" \
	-release -make libs -make tools -opensource -confirm-license -no-compile-examples \
	-xplatform win32-g++ -opengl desktop -device-option CROSS_COMPILE=/usr/bin/x86_64-w64-mingw32- \
	-skip qtwebengine -skip qtdocgallery \
	-skip qtactiveqt -skip qtcharts -skip qtdoc -skip qtlocation \
	-skip qtremoteobjects -skip qtserialbus -skip qtwebchannel \
	-skip qtwebview -skip qtandroidextras -skip qtconnectivity \
	-skip qtgamepad -skip qtmacextras -skip qtpurchasing -skip qtscript \
	-skip qttranslations -skip qtwebengine -skip qtwinextras \
	-skip qtdatavis3d -skip qtgraphicaleffects -skip qtmultimedia \
	-skip qtquickcontrols -skip qtscxml -skip qtspeech \
	-skip qtvirtualkeyboard -skip qtwebglplugin -skip qtx11extras \
	-skip qt3d -skip qtcanvas3d -skip qtdeclarative \
	-skip qtimageformats -skip qtnetworkauth -skip qtquickcontrols2 \
	-skip qtsensors -skip qtwayland -skip qtwebsockets \
	-I "/usr/include/dxsdk/"

make -j8
make install
ln -s "{{toolsdir}}/qt-{{qt_version_full}}/mingw_64/bin/qmake" /usr/bin/qmake-mingw

pushd "{{toolsdir}}/qt-{{qt_version_full}}/mingw_64/"
tar cfj "{{homedir}}/qt-{{qt_version_full}}-mingw_64.tbz2" "."
popd
