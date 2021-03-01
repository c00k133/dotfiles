#!/usr/bin/env sh

# Terminate already running bar instances
#killall --quiet polybar
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Checks for multiple monitors, taken from this ticket:
#       https://github.com/jaagr/polybar/issues/763
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload bar &
    done
else
    polybar --reload bar &
fi


echo "Bars launched..."
