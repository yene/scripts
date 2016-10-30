set t to trim(t)

on trim(someText)	repeat until someText does not start with " "		set someText to text 2 thru -1 of someText	end repeat		repeat until someText does not end with " "		set someText to text 1 thru -2 of someText	end repeat		return someTextend trim