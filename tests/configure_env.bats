#!/usr/sbin/env bats

source ./src/lib/repo_setup.sh


teardown () {
	if [ -f tests/.env ];then
		rm tests/.env
	fi
}

@test "do nothing if .env file already exists" {
	baseDir=tests
	cp env-sample tests/.env
	run configure_env $baseDir
	[[ $output = "doing nothing, the .env file already exists" ]]
}