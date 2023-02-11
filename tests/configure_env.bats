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
	[[ $output = "doing nothing, file $baseDir/.env already exists" ]]
}

@test "copy environment config from sample if no .env file exists" {
	baseDir=tests
	run configure_env $baseDir
	[ -f tests/.env ]
}

@test "ensure .env file can be loaded" {
	baseDir=tests
	cp env-sample tests/.env
	source tests/.env
	[[ ! -z $REMOTE_URL ]]
	[[ ! -z $PAGES_REPO_PATH ]]
	[[ ! -z $DEST_BRANCH ]]
	[[ ! -z $DEST_REPO ]]



}