#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Unhaze window
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

yabai -m window --toggle border
yabai -m window --opacity 0.0

