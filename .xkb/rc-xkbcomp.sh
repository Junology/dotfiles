#!/bin/sh

xkbcomp -w0 -I$HOME/.xkb -R$HOME/.xkb $HOME/.xkb/keymaps/userkbd.xkm $DISPLAY

