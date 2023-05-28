#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Set Yabai Padding
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🪟
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

yabai -m config top_padding    $1
yabai -m config bottom_padding $1
yabai -m config left_padding   $1
yabai -m config right_padding  $1
yabai -m config window_gap     $1
