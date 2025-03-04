#!/bin/bash

if [ $# -eq 0 ]; then
	echo "No arguments provided. Give the filename, and path on the remote server to copy."
	exit 1
fi

filename=$1
path=$2

#CMD="scp -r $1"

for i in {2..10}; do
	if scp -r -o ConnectTimeout=5 $filename 192.168.1.$i:$path; then
		echo "192.168.1.$i done!"
	else
		echo "192.168.1.$i is not reachable."
	fi
done
    
