#!/usr/bin/env bats

source ./src/lib/repo_setup.sh

setup () {
	if [ -d "tests/gitlab" ];then
		rmdir "tests/gitlab"
	fi	
	mkdir "tests/gitlab"
}

teardown () {
	if [ -d "tests/gitlab" ];then
		rmdir "tests/gitlab"
	fi
}

@test "noop if local repo exists" {
	local existingRemoteRepo="https://github.com/rija/ghost-ssg.git"
	result=$(create_dir_for_repo "tests/gitlab" $existingRemoteRepo)
	[[ $result =~ "doing nothing" ]]
}

@test "error message and no action taken if local repo does not exist and remote repo variable not filled" {
	result=$(create_dir_for_repo "tests/something-else")
	[[ $result =~ "repo cannot be empty" ]]
}