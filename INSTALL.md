# OS.js X11 Standalone package source installation

## User configuration
By default the user 'osjs' is used. Make sure it has access to all groups
that is required to run X, mount devices, use graphics, etc.

## Launcher
You need to compile the launcher in `opt/launcher-sources`.
Requires webkit-gtk and gtk+3 development libraries.

Just use `make` and install with `make install`

## Installation methods

### Using XDM
This package includes a Slim configuration and theme.
Make sure to use the included xinitrc

### Using built-in login manager
Add and start the rc.d service. In this case do not use the ~/.xinitrc file
