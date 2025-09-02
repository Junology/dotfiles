#!/bin/sh

BASEDIR=`dirname "$0"`
RELPATH=`realpath -s --relative-to="$HOME" "$BASEDIR"`

ln -f -s $RELPATH/.emacs.d $HOME/.emacs.d
ln -f -s $RELPATH/.vimrc $HOME/.vimrc
ln -f -s $RELPATH/.gvimrc $HOME/.gvimrc
ln -f -s $RELPATH/.xkb $HOME/.xkb

