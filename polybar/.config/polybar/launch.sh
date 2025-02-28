#!/bin/bash


# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
pgrep -x polybar > /dev/null || polybar main 2>&1 -r | tee -a /tmp/polybar.log & disown
