#!/bin/bash

display_width=yabai -m query --displays | jq '.[].frame.w'
uw_padding=20
macbook_padding=0
final_padding=0

if [[ $display_width -gt 2000 ]]; then
    final_padding=$uw_padding
else
    final_padding=$macbook_padding
fi

yabai -m config top_padding    $final_padding
yabai -m config bottom_padding $final_padding
yabai -m config left_padding   $final_padding
yabai -m config right_padding  $final_padding
yabai -m config window_gap     $final_padding
