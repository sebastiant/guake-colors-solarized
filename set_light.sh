#!/usr/bin/env bash
default='solarized'
dir=`dirname $0`

if [ -d $dir/colors/$1 ]; then
  theme=$1
else
  echo "Theme $1 not found, using $default"
  theme=$default
fi

if [ "$#" -ne 1 ]; then
  theme=$default
fi

PROFILE=${1:-Default}

gconftool-2 -s -t string /apps/guake/style/background/color `cat $dir/colors/$theme/base3`
gconftool-2 -s -t string /apps/guake/style/font/color `cat $dir/colors/$theme/base00`
gconftool-2 -s -t string /apps/guake/style/font/palette `cat $dir/colors/$theme/palette`
gconftool-2 -s -t int /apps/guake/style/background/transparency `cat transparency_level`
