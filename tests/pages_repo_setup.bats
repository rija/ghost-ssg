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
	existingRemoteRepo="https://github.com/rija/ghost-ssg.git"
	result=$(create_dir_for_repo "tests/gitlab" $existingRemoteRepo)
	[[ $result =~ nothing  ]]
}