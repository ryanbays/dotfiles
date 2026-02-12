#!/usr/bin/bash

CONFIG="$HOME/.config/waybar/config.jsonc"

# Get monitor names from Hyprland
MONITORS=($(hyprctl monitors -j | jq -r '.[].name'))

# Get current monitor from Waybar config
CURRENT=$(jq -r '.output // empty' "$CONFIG")


# If no output is set, assume first monitor
if [[ -z "$CURRENT" ]]; then
    CURRENT="${MONITORS[0]}"
fi

echo Current monitor: "$CURRENT"

# Find index of current monitor
for i in "${!MONITORS[@]}"; do
    if [[ "${MONITORS[$i]}" == "$CURRENT" ]]; then
        INDEX=$i
        break
    fi
done

# Next monitor (wrap around)
NEXT_INDEX=$(( (INDEX + 1) % ${#MONITORS[@]} ))
NEXT_MONITOR="${MONITORS[$NEXT_INDEX]}"

echo Next monitor: "$NEXT_MONITOR"

# Update Hyprlock config
sed -i "s/^\$main_monitor = .*/\$main_monitor = $NEXT_MONITOR/" ~/.config/hypr/main_monitor.conf
# Update Waybar config
jq ".output = \"$NEXT_MONITOR\"" "$CONFIG" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"

# Restart Waybar
pkill waybar
waybar &

