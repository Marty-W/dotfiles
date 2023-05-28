#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Previous track
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

tell application "Spotify"
	set currentTrack to name of current track
	previous track
	set nextTrack to name of current track
	if currentTrack is equal to nextTrack then
		previous track
	end if
    delay 0.5
	set theTrack to name of current track
	set theArtist to artist of current track
	display notification theArtist & ": " & theTrack with title "⏮" 
end tell
