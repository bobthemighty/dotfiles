#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
dbus-update-activation-environment --systemd DISPLAY

exec i3
