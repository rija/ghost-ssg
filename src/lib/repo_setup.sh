#!/usr/bin/env bash

set -e

create_dir_for_repo () {
	pwd
	baseDir=$1 
	remoteRepo=$2
	if [ -d $baseDir ];then
		echo "doing nothing, $baseDir already exists"
	 	exit 0
	else
		echo "Creating directory..."
	fi
}