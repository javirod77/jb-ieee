#!/bin/bash
echo "Creating new post:"
echo "Enter the post title, followed by [ENTER]:" 
read title

if [ "$title" != "" ]; then
	rake post title=$title
else
	echo "No post title provided. ABORTING."
fi