#!/bin/bash

cd "{{toolsdir}}/qt5-src/"
./init-repository --module-subset=default,-qtwebengine --branch
./configure -sql-mysql -release -opensource -confirm-license -make libs -make tools -prefix "{{toolsdir}}/qt-{{qt_version_full}}/x86_64/" -skip qtwebengine -skip qtdocgallery

make -j8
make install

pushd "{{toolsdir}}/qt-{{qt_version_full}}/x86_64/"
tar cfj "{{homedir}}/qt-{{qt_version_full}}-x86_64.tbz2" "."
popd
