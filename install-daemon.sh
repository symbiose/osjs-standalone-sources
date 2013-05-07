#!/bin/bash
#
# Daemon installation script
#
# Copyright (c) 2013 Anders Evenrud <andersevenrud@gmail.com>
# Released under the 2-clause BSD license.
#

if [ "$1" == "uninstall" ]; then
  [[ -f /usr/sbin/update-rc.d ]] && update-rc.d osjs remove
  [[ -f /usr/sbin/rc-update ]] && rc-update remove osjs
elif [ "$1" == "install" ]; then
  [[ -f /usr/sbin/update-rc.d ]] && update-rc.d osjs defaults 98
  [[ -f /usr/sbin/rc-update ]] && rc-update add osjs default
fi
