#!/usr/bin/env bats

source ./src/lib/repo_setup.sh

teardown () {
	if [ -d tests/ghost_backups ];then
		rmdir tests/ghost_backups
	fi
}

@test "if backup directory exists, do nothing" {
	baseDir=tests
	mkdir $baseDir/ghost_backups
	run create_backup_dir $baseDir
	[[ $output = "doing nothing, $baseDir/ghost_backups already exists" ]]
}

@test "if backup directory do not exists, create it" {
	baseDir=tests
	run create_backup_dir $baseDir
	[ -d $baseDir/ghost_backups ]
}
