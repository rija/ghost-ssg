#!/usr/sbin/env bats

source ./src/lib/repo_setup.sh

teardown () {
	if [ -d tests/site ];then
		rmdir tests/site
	fi
	if [ -d tests/stage ];then
		rmdir tests/stage
	fi
}

@test "if site directory exists, do nothing" {
	baseDir=tests
	mkdir $baseDir/site
	run create_runtime_dirs $baseDir
	[[ $output = "doing nothing, $baseDir/site already exists" ]]

}

@test "if site directory do not exists, create it" {
	baseDir=tests
	run create_runtime_dirs $baseDir
	[ -d $baseDir/site ]
}

@test "if stage directory exists, do nothing" {
	baseDir=tests
	mkdir $baseDir/stage
	run create_runtime_dirs $baseDir
	[[ $output = "doing nothing, $baseDir/stage already exists" ]]
}