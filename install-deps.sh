#!/bin/bash
#
# Dependency installation script
#
# Copyright (c) 2013 Anders Evenrud <andersevenrud@gmail.com>
# Released under the 2-clause BSD license.
#

if [ -f /usr/bin/apt-get ]; then
  apt-get install xorg xauth xcursor-themes
  apt-get install alsa-utils pulseaudio pulseaudio-module-x11
  apt-get install libwebkitgtk-3.0 libwebkitgtk-3.0-dev
elif [ -f /usr/bin/emerge ]; then
  emerge xorg-server xauth xcursor-themes alsa pulseaudio libwebkitgtk
fi

