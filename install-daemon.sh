#!/bin/bash
#
# Daemon installation script
#
# Copyright (c) 2013 Anders Evenrud <andersevenrud@gmail.com>
# Released under the 2-clause BSD license.
#

if [ "$1" == "uninstall" ]; then
  [[ -f /usr/sbin/update-rc.d ]] && update-rc.d -f osjs remove

  [[ -f /usr/sbin/rc-update ]] && rc-update remove osjs

  rm -rf /etc/init.d/osjs
elif [ "$1" == "install" ]; then
  [[ -f /usr/sbin/update-rc.d ]] && cp etc/init.d/osjs-debian /etc/init.d/osjs
  [[ -f /usr/sbin/update-rc.d ]] && update-rc.d -f osjs defaults 98

  [[ -f /usr/sbin/rc-update ]] && cp etc/init.d/osjs-gentoo /etc/init.d/osjs
  [[ -f /usr/sbin/rc-update ]] && rc-update add osjs default
fi

	cp etc/init.d/osjs /etc/init.d/
exit 0

