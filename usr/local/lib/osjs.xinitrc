#!/bin/sh
#
# Default X initialization script (For built-in login manager)
#

xsetroot -cursor /usr/share/icons/whiteglass
xsetroot -cursor_name left_ptr
/usr/bin/start-pulseaudio-x11

# Launch the X11 Client
exec /usr/local/bin/osjs-launcher

