#!/bin/sh

XKBPATH=/usr/share/X11/xkb
SYMB=symbols/
EVDEV=rules/evdev

cp jphenk "$XKBPATH/$SYMB"
cp jpmuhen "$XKBPATH/$SYMB"

patch -u -N -b -z .bak "$XKBPATH/$EVDEV" < ./evdev.patch

