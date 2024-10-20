#!/usr/bin/env bash

POLYNAME=".polybar-wrappe"
DIR="~/.config/polybar"
# Terminate already running bar instances
killall -q $POLYNAME 

# Wait until the processes have been shut down
while pgrep -u $UID -x $POLYNAME > /dev/null; do sleep 1; done

# Launch the bar
polybar -q main -c "$DIR"/config/config.ini &
