#!/bin/sh

XKBPATH=/usr/share/X11/xkb
SYMB=symbols/
EVDEV=rules/evdev

cp jphenk "$XKBPATH/$SYMB"
cp jpmuhen "$XKBPATH/$SYMB"

cp "$XKBPATH/$EVDEV" "$XKBPATH/$EVDEV.bak"
cat ./loc_evdev >> "$XKBPATH/$EVDEV"

