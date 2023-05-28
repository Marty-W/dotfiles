#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Add yabai float rule for app
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "App name" }

echo "yabai -m rule --add app='$1' manage=off layer=above border=off" >>~/.yabairc
yabai -m rule --add app="$1" manage=off layer=above border=off
