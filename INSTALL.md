# OS.js X11 Standalone package source installation

## User configuration
By default the user 'osjs' is used. Make sure it has access to all groups
that is required to run X, mount devices, use graphics, etc.

## Launcher
The X11 launcher requires webkit-gtk and gtk+3 development libraries.

## Installation methods

### Using XDM
This package includes a Slim configuration and theme.
Make sure to use the included xinitrc

Command (sudo): `make all && make install && make slim`

### Using built-in login manager
Add and start the rc.d service. In this case do not use the ~/.xinitrc file

Command (sudo): `make all && make install && make system_wide`

## Uninstall

Command (sudo): `make uninstall`
