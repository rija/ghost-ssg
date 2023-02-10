#!/usr/bin/env bash

set -e

create_dir_for_repo () {
	pwd
	repoBaseDir=$1 
	remoteRepo=$2
	if [ -d $repoBaseDir ];then
		echo "doing nothing, $repoBaseDir already exists"
	elif [ -z $remoteRepo ];then
		echo "repo cannot be empty"
	else
		echo "try cloning $remoteRepo"
		git clone $remoteRepo $repoBaseDir
	fi
}

configure_ghost () {
	ghostBaseDir=$1
	if [ -f $ghostBaseDir/config.production.json ];then
		echo "doing nothing, the configuration file already exists"
	else
		cp config.production.json.sample $ghostBaseDir/config.production.json
	fi
}

configure_env () {
	envBaseDir=$1
	if [ -f $envBaseDir/.env ];then
		echo "doing nothing, file $envBaseDir/.env already exists"
	else
		cp env-sample $envBaseDir/.env
	fi
}

create_runtime_dirs () {
	runtimeDir=$1
	if [ -d $runtimeDir/site ];then
		echo "doing nothing, $runtimeDir/site already exists"
	else
		mkdir $runtimeDir/site
	fi
}