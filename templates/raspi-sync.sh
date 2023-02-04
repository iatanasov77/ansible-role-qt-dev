#!/bin/bash

RASPI_ADDRESS=${RASPI_ADDRESS:="{{raspi_address}}"}
RASPI_USER=${RASPI_USER:="{{raspi_user}}"}

rsync -avz --delete --rsync-path="sudo rsync" "{{toolsdir}}/raspberrypi-qt/qt5pi/" $RASPI_USER@$RASPI_ADDRESS:/usr/local/qt-{{qt_version_full}}/
