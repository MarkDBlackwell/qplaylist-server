#!/bin/sh -e

# Copyright (C) 2022 Mark D. Blackwell.
#   All rights reserved.
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# The path to the directory containing this script (without a trailing separator):
script_directory="$( cd "$( dirname $0 )" && echo $PWD )"
#echo "script_directory = $script_directory"

cd $script_directory

/usr/bin/tar --extract --file all.tar

#-------------
cp --target-directory=/etc/apache2/conf-available \
  local-settings.conf \
  security.conf

#-------------
sudo apache2ctl graceful

rm *.conf

echo "Success"
