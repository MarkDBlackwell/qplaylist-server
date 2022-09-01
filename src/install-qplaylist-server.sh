#!/bin/sh -e

# Copyright (C) 2022 Mark D. Blackwell.
#   All rights reserved.
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# The path to the directory containing this script (without a trailing separator):
script_directory="$( cd "$( dirname $0 )" && echo $PWD )"

# The script basename:
script_basename="$( basename $0 )"

#-------------
cd $script_directory

/usr/bin/tar --extract --file all.tar

#-------------
cp --target-directory=/etc/apache2/conf-available \
  local-settings.conf \
  security.conf

#-------------
sudo apache2ctl graceful

mv $script_basename $script_basename-save

rm -fv *.conf *.sh

mv $script_basename-save $script_basename

echo "Success"
