#!/bin/bash

cd "{{toolsdir}}/qt5-src/"

##########################################################################
# Manual How to Build: https://wiki.qt.io/Building_Qt_5_from_Git/bg
##########################################################################

# Clean Source Tree
#git submodule foreach 'git clean -dffx'

./init-repository --module-subset=default,-qtwebengine --branch
./configure -prefix "{{toolsdir}}/qt-{{vs_qt_version_full}}/x86_64/" \
	#-recheck-all \
	-release -opensource -confirm-license -make libs -make tools \
	-opengl desktop -platform linux-g++-64 \
	-nomake tests -nomake examples \
	-sql-mysql \
	-feature-library \
	-skip qtwebengine -skip qtdocgallery
	
#make -j8
make -j$(nproc)
#make module-qtspeech
#make module-qttools
make install

pushd "{{toolsdir}}/qt-{{vs_qt_version_full}}/x86_64/"
tar cfj "{{homedir}}/qt-{{vs_qt_version_full}}-x86_64.tbz2" "."
popd
