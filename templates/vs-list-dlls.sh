#!/bin/bash

# Usage: vs-list-dlls.sh /projects/MyProject/build/release/MyProject.exe

# HOWTO: https://stackoverflow.com/questions/29678352/how-to-use-qts-windeployqt-in-linux-fedora
WINEDEBUG=+loaddll wine $1 2> dll.log
grep Loaded dll.log | grep -v 'system32\|:load_builtin_dll' \
  | awk -F'"' '{print $2}' \
  | sed -e 's@\\\\@/@g' -e 's/^[A-Z]://' \
  | sort > dll.lst
  
echo "List writed to 'dll.lst'"
