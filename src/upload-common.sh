#!/bin/sh -e

# Copyright (C) 2022 Mark D. Blackwell.
#   All rights reserved.
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# The path to the directory containing this script (without a trailing separator):
script_directory="$( cd "$( dirname $0 )" && echo $PWD )"
#echo "script_directory = $script_directory"

cd $script_directory/..

if [ -d develop-tmp ]; then
  rm -r develop-tmp
fi
mkdir develop-tmp

#-------------
cp --target-directory=develop-tmp \
      src/install-qplaylist-server.sh \
      src/local-settings.conf \
      src/security.conf
