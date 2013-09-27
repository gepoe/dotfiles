!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#read .Xresources
xrdb ~/.Xresources 

#remap capslock to escape
setxkbmap -layout de
setxkbmap -option caps:escape &

#screensaver und dpms disable
xset -dpms
xset s off

#thunar daemon
thunar --daemon &

#WifiManagement
nm-applet &

#turn numlock on
numlockx on

exec i3
