#!/bin/bash

xls2csv users.xls > users.csv

input="/home/zahrah/Documents/gslw_tp1/users.csv"
array=($(awk -F: '{ print $1 }' /etc/passwd ))
i=0;

while IFS= read -r line
do
	i=0
	for item in ${array[*]}
	do
		if [ "$line" = "\$item\"" ]; then
			i=$((i+1))
		fi
	done
	if [ "$i" = 0 ]; then
		var="$(echo $line | sed 's/\"//g')"
		useradd $line
		mkhomedir_helper $line
	fi
done < $input
