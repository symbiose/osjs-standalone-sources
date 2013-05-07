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
	make -C opt/launcher-sources install

clean:
	make -C opt/launcher-sources clean

slim:
	mkdir -p /usr/share/slim/themes
	cp -Rf usr/share/themes/osjs /usr/share/slim/themes/

system_wide:
	cp etc/init.d/osjs /etc/init.d/
	update-rc.d osjs defaults 98

uninstall:
	rm -rf /usr/local/bin/osjs*
	rm -rf /usr/local/lib/osjs*
	rm -rf /etc/init.d/osjs
	rm -rf /usr/local/share/doc/osjs
	rm -rf /usr/share/slim/themes/osjs
	make -C opt/launcher-sources uninstall
	update-rc.d osjs remove
