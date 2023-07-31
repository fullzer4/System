#!/bin/bash

monitor_name="$1"

spaces() {
    json_data=$(hyprctl workspaces -j)
    monitor_json=$(echo "$json_data" | jq --arg m "$monitor_name" 'map(select(.monitor == $m) | {id: .id|tostring})')
    echo $monitor_json
}

monitor_spaces() {
    socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
        spaces
    done
}

spaces
monitor_spaces
