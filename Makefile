#
# Makefile for OS.js Base Package
#
# Copyright (c) 2013 Anders Evenrud <andersevenrud@gmail.com>
# Released under the 2-clause BSD license.
#
#
all:
	make -C opt/launcher-sources all

install:
	mkdir -p /usr/local/bin
	mkdir -p /usr/local/lib
	mkdir -p /usr/local/share/doc/osjs
	mkdir -p /lib/plymouth/themes
	cp -Rf usr/local/bin/osjs* /usr/local/bin/
	cp -Rf usr/local/lib/osjs* /usr/local/lib/
	make -C opt/launcher-sources install

clean:
	make -C opt/launcher-sources clean

slim:
	mkdir -p /usr/share/slim/themes
	cp etc/slim.conf /etc/
	cp -Rf usr/share/themes/osjs /usr/share/slim/themes/

system_wide:
	./install-daemon.sh install

virtualbox:
	cp etc/X11/xorg.conf /usr/share/X11/xorg.conf.d/99-osjs.conf
#	cp etc/X11/xorg.conf /etc/X11/xorg.conf

dependencies:
	./install-deps.sh

plymouth:
	cp -rf lib/plymouth/themes/osjs /lib/plymouth/themes/

uninstall:
	rm -rf /usr/local/bin/osjs*
	rm -rf /usr/local/lib/osjs*
	rm -rf /usr/local/share/doc/osjs
	rm -rf /usr/share/slim/themes/osjs
	rm -rf /lib/plymouth/themes/osjs
	make -C opt/launcher-sources uninstall
	./install-daemon.sh uninstall
