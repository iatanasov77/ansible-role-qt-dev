#!/bin/bash

cd "{{toolsdir}}/qt5-src/"

#make clean
git submodule foreach --recursive "git clean -dfx" && git clean -dfx

