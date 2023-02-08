#!/usr/bin/env bash

set -e

create_dir_for_repo () {
	pwd
	baseDir=$1 
	remoteRepo=$2
	if [ -d $baseDir ];then
		echo "doing nothing, $baseDir already exists"
	elif [ -z $remoteRepo ];then
		echo "repo cannot be empty"
	else
		echo "try cloning $remoteRepo"
	fi
}