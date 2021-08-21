#!/bin/bash
#
# MANUAL: https://medium.com/@vladadgad/cross-compile-qt-for-windows-on-linux-platform-57e4b71ed1aa
##########################################################################################################
cd "{{toolsdir}}/qt5-src/"

##########################################################################
# Manual How to Build: https://wiki.qt.io/Building_Qt_5_from_Git/bg
##########################################################################

# Clean Source Tree
#git submodule foreach 'git clean -dffx'

./init-repository --module-subset=default,-qtwebengine --branch
# -skip qtspeech \
# -skip qtdeclarative \
./configure -prefix "{{toolsdir}}/qt-{{vs_qt_version_full}}/mingw_64/" \
	#-recheck-all \
	-plugin-sql-mysql MYSQL_INCDIR="/usr/mingw64/include/mariadb/" MYSQL_LIBDIR="/usr/mingw64/lib/" \
	-opengl dynamic -I "/home/vagrant/tools/qt5-src/qtbase/src/3rdparty/angle/include/" \
	-release -make libs -make tools -opensource -confirm-license -no-compile-examples \
	-nomake tests -nomake examples \
	-xplatform win32-g++ -device-option CROSS_COMPILE=/usr/bin/x86_64-w64-mingw32- \
	-skip qtwebengine -skip qtdocgallery \
	-skip qtactiveqt -skip qtcharts -skip qtdoc -skip qtlocation \
	-skip qtremoteobjects -skip qtserialbus -skip qtwebchannel \
	-skip qtwebview -skip qtandroidextras -skip qtconnectivity \
	-skip qtgamepad -skip qtmacextras -skip qtpurchasing -skip qtscript \
	-skip qttranslations -skip qtwebengine -skip qtwinextras \
	-skip qtdatavis3d -skip qtgraphicaleffects -skip qtmultimedia \
	-skip qtquickcontrols -skip qtscxml \
	-skip qtvirtualkeyboard -skip qtwebglplugin -skip qtx11extras \
	-skip qt3d -skip qtcanvas3d \
	-skip qtimageformats -skip qtnetworkauth -skip qtquickcontrols2 \
	-skip qtsensors -skip qtwayland -skip qtwebsockets \
	-I "/usr/include/dxsdk/" \
	-D_POSIX_THREAD_SAFE_FUNCTIONS

# CFLAGS="-I/usr/include/dxsdk/" make -j8
#make -j8
make -j$(nproc)
#make module-qtspeech
#make module-qttools
make install
ln -sf "{{toolsdir}}/qt-{{vs_qt_version_full}}/mingw_64/bin/qmake" /usr/bin/qmake-mingw

pushd "{{toolsdir}}/qt-{{vs_qt_version_full}}/mingw_64/"
tar cfj "{{homedir}}/qt-{{vs_qt_version_full}}-mingw_64.tbz2" "."
popd
