#!/bin/bash

ConvertFiles()
{
	folder=$1
	trackId=$2
	outputFolder=$3

	for file in "$folder"/*;
	do
		mkvmerge -o "${outputFolder}/${file##*/}" --default-track $trackId --forced-track $trackId:1 "$file"
	done
}