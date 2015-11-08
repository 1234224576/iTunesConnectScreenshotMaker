set filePath to get (choose file of type {"png"})
set imagePath to get POSIX path of filePath

set sizes_width to {750, 1242, 640, 640, 750, 2048}
set sizes_height to {1334, 2208, 1136, 960, 1024, 2732}

tell application "Finder"
	set saveDirectory to get (folder of filePath as Unicode text)
	set fileName to name of filePath as Unicode text
end tell

repeat with i from 1 to 6
	tell application "Image Events"
		launch
		set img to open imagePath
		scale img to size item i of sizes_height
		crop img to dimensions {item i of sizes_width, item i of sizes_height}
		set imgName to (item i of sizes_width as string) & "x" & (item i of sizes_height as string) & "_" & fileName
		save img in file (saveDirectory & imgName) as PNG
		close img
	end tell
end repeat