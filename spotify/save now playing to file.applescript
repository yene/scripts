
set oldTrack to ""
set current_user to do shell script "whoami"

set the_file to "/Users/" & current_user & "/NowPlaying.txt"
do shell script "touch " & POSIX path of the_file
set oldSong to ""

repeat
	if application "Spotify" is not running then
		say "spotify is not running"
		return
	end if
	tell application "Spotify"
		try
			if player state is playing then
				set theTrack to name of the current track
				set theArtist to artist of the current track
				set theAlbum to album of the current track
				if oldTrack is not equal to theTrack then
					set oldTrack to theTrack
					tell application "Finder"
						try
							set eof of the_file to 0
							set theSong to "\"" & theTrack & "\"" & " by " & theArtist
							-- only save when new song is played to protect SSD
							if (theSong is not equal to oldSong) then
								write (theSong) to the_file as Çclass utf8È
							end if
							set oldSong to theSong
							
						end try
					end tell
				end if
			end if
		end try
	end tell
	
	
	delay 5
end repeat