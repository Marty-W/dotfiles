#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Pause track
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

tell application "Spotify"
	playpause
	set theTrack to name of current track
	set theArtist to artist of current track
	
	set current to player position
	set mins to (round (current / 60) rounding down)
	set secs to (round (current mod 60) rounding down)
	if secs is less than 10 then
		set secs to "0" & secs
	end if
	set elapsed to mins & ":" & secs
	
	set totalSecs to ((duration of current track) / 1000)
	set mins to (round (totalSecs / 60) rounding down)
	set secs to (totalSecs mod 60 div 1)
	if secs is less than 10 then
		set secs to "0" & secs
	end if
	set total to mins & ":" & secs
	
	display notification theArtist & ": " & theTrack with title "⏯ " & elapsed & " / " & total
end tell
