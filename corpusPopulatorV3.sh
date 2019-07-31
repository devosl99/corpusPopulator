#!/bin/bash

#Luke De Vos
#EVL Lab
#Script iterates through each file in the passed directory and prints "author, realpath, filename by author" to standard output

# To use: 
#	$./corpusPopulatorV3.sh [path to directory] >> [output].csv

# NOTE: assumes the directory containing the text files to be added is named the author's name
#	ie: */[author's name]/file.txt


dirPath=$(realpath $1)
author=$(echo $dirPath | awk -F "/" '{print $(NF)}')

for file in $dirPath/*;
	do fileName="$(echo $file | awk -F "/" '{print $NF}')"; 
	echo "$author,$file,$fileName by $author" | paste -d ",";
done

