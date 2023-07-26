#!/bin/bash

json_data=$(hyprctl workspaces -j)

create_monitor_json() {
    monitor_name=$1
    monitor_json=$(echo "$json_data" | jq --arg m "$monitor_name" 'map(select(.monitor == $m) | {id: .id})')
}

if [ -z "$1" ]; then
    all_json=$(echo "$json_data" | jq '{id: .id, monitor: .monitor}')
else
    monitor_name="$1"
    create_monitor_json "$monitor_name"
fi

