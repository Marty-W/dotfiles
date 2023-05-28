#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Yabai 3 var
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 👑
# @raycast.argument1 { "type": "text", "placeholder": "width" }

yabai -m space --balance && yabai -m window --resize left:-$1:0 && yabai -m window --resize right:$1:0

