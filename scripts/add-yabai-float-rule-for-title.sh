#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Add yabai float rule for title
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🛟
# @raycast.argument1 { "type": "text", "placeholder": "window title" }

echo "yabai -m rule --add title='$1' manage=off layer=above border=off" >>~/.yabairc
yabai -m rule --add title="$1" manage=off layer=above border=off
