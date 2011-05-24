#!/bin/bash

address=$(zenity --width=600 --height=150 --entry --title="YouTube MP3/OGG Extractor" --text "Enter Youtube address (then click OK and then select the destination directory for your MP3 file):")
format=$(zenity --list --radiolist --title="Choose which format you want to convert to" \
			--column="Selection" --column="Format" \
			FALSE "OGG" \
			FALSE "MP3" \
)
return_code=$?
regex='v=(.*)'
dest_dir=$(zenity --file-selection --directory)
if [[ $return_code -eq 0 ]]; then
	if
		[[ "$format" =~ "OGG" ]] ; then
		video_id=$(echo $address | sed 's/http.*.?v=//')
		video_id=$(echo $video_id | cut -d'&' -f1)
		video_title="$(youtube-dl --get-title $address)"
		youtube-dl $address

		if [ -e $video_id.flv ]; then
			ext="flv"
		elif 
			[ -e $video_id.mp4 ]; then
			ext="mp4"
		else
			echo "Failed."
			exit
		fi

		ffmpeg -i $video_id.$ext "$HOME/$video_title.wav"
		oggenc -t "$video_title" -q 10 $HOME/"$video_title".wav -o $dest_dir/"$video_title".ogg
		rm $video_id.$ext $HOME/"$video_title".wav

	    zenity --width=260 --height=130 --title "YouTube MP3/OGG Extractor" --info --text "Your OGG file is ready."
	elif
		[[ "$format" =~ "MP3" ]]; then
		video_id=$(echo $address | sed 's/http.*.?v=//')
		video_id=$(echo $video_id | cut -d'&' -f1)
		video_title="$(youtube-dl --get-title $address)"
		youtube-dl $address

		if [ -e $video_id.flv ]; then
			ext="flv"
		elif 
			[ -e $video_id.mp4 ]; then
			ext="mp4"
		else
			echo "Failed."
			exit
		fi

		ffmpeg -i $video_id.$ext "$HOME/$video_title.wav"
		lame $HOME/"$video_title".wav $dest_dir/"$video_title".mp3
		rm $video_id.$ext $HOME/"$video_title".wav

	    zenity --width=260 --height=130 --title "YouTube MP3/OGG Extractor" --info --text "Your MP3 file is ready."
	fi
fi



