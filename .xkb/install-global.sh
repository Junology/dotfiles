#!/bin/sh

XKBPATH=/usr/share/X11/xkb
SYMB=symbols/
EVDEV=rules/evdev

cp -r $SYMB/* "$XKBPATH/$SYMB"
patch -u -N -b -z .bak "$XKBPATH/$EVDEV" < ./evdev.patch
patch -u -N -b -z .bak "$XKBPATH/$EVDEV.lst" < ./evdev.lst.patch

