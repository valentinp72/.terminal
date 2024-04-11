#!/usr/bin/env sh

polybar-msg cmd quit

# polybar base &

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload base &
  done
else
  polybar --reload base &
fi
