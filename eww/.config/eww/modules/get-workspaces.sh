#!/bin/bash

spaces (){
	hyprctl workspaces -j | jq 'map({id: .id | tostring}) | sort_by(.id)' -Mc
}

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do
	spaces
done

