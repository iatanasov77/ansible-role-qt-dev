#!/bin/bash

RASPI_VERSION=linux-rasp-pi2-g++
SYSROOT_DIR="{{toolsdir}}/toolchains/arm-rpi-linux-gnueabihf/arm-rpi-linux-gnueabihf/sysroot/"

cd "{{toolsdir}}/qt5-src/"
./init-repository --module-subset=default,-qtwebengine --branch

# to re-configure (if the sysroot was changed for example) add the parameter '-recheck-all'
./configure -release -opengl es2 -device $RASPI_VERSION -device-option CROSS_COMPILE="{{toolsdir}}/toolchains/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf-" -sysroot "$SYSROOT_DIR" -opensource -confirm-license -make libs -make tools -prefix /usr/local/qt -extprefix "{{toolsdir}}/raspberrypi-qt/qt5pi/" -hostprefix "{{toolsdir}}/raspberrypi-qt/qt5/" -no-use-gold-linker -no-gbm -skip qtwebengine -skip qtdocgallery -I "$SYSROOT_DIR/usr/include/arm-linux-gnueabihf/"

make -j8
make install

pushd "{{toolsdir}}/raspberrypi-qt/qt5pi/"
tar cfj "{{ ansible_env.HOME }}/raspi_qt-{{qt_version_full}}.tbz2" "."
popd

pushd "{{toolsdir}}/raspberrypi-qt/qt5/"
tar cfj "{{ ansible_env.HOME }}/raspi_host_qt-{{qt_version_full}}.tbz2" "."
popd
