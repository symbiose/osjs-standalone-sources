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
	cp -Rf usr/local/bin/osjs* /usr/local/bin/
	cp -Rf usr/local/lib/osjs* /usr/local/lib/
	cp etc/rc.d/osjs /etc/rc.d/
	make -C opt/launcher-sources install

clean:
	make -C opt/launcher-sources clean

slim:
	mkdir -p /usr/share/slim/themes
	cp -Rf usr/share/themes/osjs /usr/share/slim/themes/

uninstall:
	rm -rf /usr/local/bin/osjs*
	rm -rf /usr/local/lib/osjs*
	rm -rf /etc/rc.d/osjs
	rm -rf /usr/local/share/doc/osjs
	rm -rf /usr/share/slim/themes/osjs
	make -C opt/launcher-sources uninstall
