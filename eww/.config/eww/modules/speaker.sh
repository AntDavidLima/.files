#!/bin/sh

case $1 in
      "toggle") command="--toggle-mute" ;;
      "up") command="--change-volume +5" ;;
      "down") command="--change-volume -5" ;;
      "pull") command="" ;;
      *) command="--set-volume $1" ;;
esac

[ -n "$command" ] && pulsemixer $command 
mute=$(pulsemixer --get-mute)
if [ "$mute" = "1" ]; then
      icon="󰖁"
      volume="$(pulsemixer --get-volume | awk '{print $1}')"
else 
      volume="$(pulsemixer --get-volume | awk '{print $1}')"
      if [ "$volume" -gt 100 ]; then
            icon="󱄠"
      elif [ "$volume" -gt 66 ]; then
            icon="󰕾"
      elif [ "$volume" -gt 33 ]; then 
            icon="󰖀"
      else 
            icon="󰕿"
      fi
      volume="$volume"
fi

echo "{\"content\": \"$volume\", \"icon\": \"$icon\"}"

