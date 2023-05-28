#!/bin/bash

num_of_windows=$(yabai -m query --windows --space | jq '. | length')
has_border=$(yabai -m query --windows --space | jq ' if .[0]."has-border" then 1 else 0 end')
borderless_window_id=$(
	yabai -m query --windows --space | jq 'map({id: .id, border: ."has-border"}) | map(select(.border == false)) | map(.id) | .[0]'
)

# When I create or destroy a window, I want to get all windows on the current space
# If there is only one window, I want to know if it has a border, if it does, I want to remove it

if [ "$num_of_windows" -eq 1 ]; then
	if [ "$has_border" -eq 1 ]; then
		yabai -m window --toggle border
		yabai -m config --space mouse right_padding 5
		yabai -m config --space mouse left_padding 5
		yabai -m config --space mouse top_padding 5
		yabai -m config --space mouse bottom_padding 5
	fi
elif [ "$num_of_windows" -eq 2 -a "$borderless_window_id" != 'null' ]; then
	yabai -m window "$borderless_window_id" --toggle border
	yabai -m config --space mouse window_gap 5
fi
