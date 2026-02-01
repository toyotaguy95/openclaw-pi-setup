#!/bin/bash
# Talon Face Display Controller
# Displays lobster face GIFs based on state file

FACE_DIR="$HOME/talon-face/gifs"
STATE_FILE="$HOME/talon-face/state"
CURRENT_STATE=""
FEH_PID=""

# Initialize state
echo "idle" > "$STATE_FILE"

cleanup() {
    echo "Shutting down face display..."
    [ -n "$FEH_PID" ] && kill $FEH_PID 2>/dev/null
    exit 0
}

trap cleanup SIGTERM SIGINT

show_face() {
    local state=$1
    local gif="$FACE_DIR/${state}.gif"

    if [ ! -f "$gif" ]; then
        echo "Warning: $gif not found, using idle"
        gif="$FACE_DIR/idle.gif"
    fi

    # Kill previous feh instance
    [ -n "$FEH_PID" ] && kill $FEH_PID 2>/dev/null

    # Start feh with the new GIF
    # DSI-1 touch display is 720x1280 at X offset 1920 (right of HDMI)
    # GIFs are already 720x1280, so no scaling needed - just position correctly
    DISPLAY=:0 feh --geometry 720x1280+1920+0 --scale-down --reload 1 "$gif" &
    FEH_PID=$!

    echo "Showing: $state"
}

echo "🦞 Talon Face Display starting..."
echo "State file: $STATE_FILE"
echo "To change state: echo 'thinking' > $STATE_FILE"

# Initial display
show_face "idle"

# Watch for state changes
while true; do
    NEW_STATE=$(cat "$STATE_FILE" 2>/dev/null || echo "idle")

    if [ "$NEW_STATE" != "$CURRENT_STATE" ]; then
        CURRENT_STATE="$NEW_STATE"
        show_face "$CURRENT_STATE"
    fi

    sleep 0.5
done
