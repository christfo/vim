#!/bin/sh
Xvfb :0 -screen 0 1600x1200x24 +extension RANDR +extension GLX &
DISPLAY=localhost:0.0 x11vnc -auth ~/.Xauthority -forever -loop -noxdamage -repeat -rfbport 5900 -shared -rfbauth ~/.vnc/passwd &
#   Start the following after Xvfb starts.
DISPLAY=localhost:0.0 openbox


