tell application "Finder"
	activate
	set b to target of front window
	tell application "System Events" to keystroke "t" using command down
	set target of front window to b
end tell