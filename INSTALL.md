# OS.js X11 Standalone package source installation

## User configuration
By default the user 'osjs' is used. Make sure it has access to all groups
that is required to run X, mount devices, use graphics, etc.

## Launcher
The X11 launcher requires webkit-gtk and gtk+3 development libraries.

## Installation methods

### Using built-in login manager
In this case **do not** use the supplied ~/.xinitrc file

Command: `make all && sudo make install && sudo make system_wide`

### Using XDM
This package includes a Slim configuration and theme.
Make sure **to use** the included xinitrc

Command: `make all && sudo make install && sudo make slim`

### VirtualBox machines
Install X11 configurations etc with `sudo make virtualbox`

## Uninstall

Command: `sudo make uninstall`
