#!/usr/bin/env bash

set -e

create_dir_for_repo () {
	repoFullPath=$1 
	remoteRepo=$2
	if [ -d $repoFullPath ];then
		echo "doing nothing, $repoFullPath already exists"
	elif [ -z $remoteRepo ];then
		echo "repo cannot be empty"
	else
		echo "try cloning $remoteRepo"
		git clone $remoteRepo $repoFullPath
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

	if [ -d $runtimeDir/stage ];then
		echo "doing nothing, $runtimeDir/stage already exists"
	else
		mkdir $runtimeDir/stage
	fi
}

create_backup_dir () {
	backupDir=$1
	if [ -d $backupDir/ghost_backups ];then
		echo "doing nothing, $backupDir/ghost_backups already exists"
	else
		mkdir $backupDir/ghost_backups
	fi
}
