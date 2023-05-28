#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Next track
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Next track on Spotify

tell application "Spotify"
	next track
    delay 0.5
	set theTrack to name of current track
	set theArtist to artist of current track
	display notification theArtist & ": " & theTrack with title "⏭️"
end tell
