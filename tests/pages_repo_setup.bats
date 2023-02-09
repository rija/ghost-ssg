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
	if [ -d "tests/myrepo" ];then
		rm -rf "tests/myrepo"
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

@test "clone remote repo if local repo does not exist and remote repo exists" {
	local existingRemoteRepo="https://gitlab.com/gh-rija/ssg-test-output.git"
	result=$(create_dir_for_repo "tests/myrepo" $existingRemoteRepo)
	[[ $result =~ "try cloning $existingRemoteRepo" ]]
	[ -d "tests/myrepo" ]
}

@test "error message and no action taken if remote repo cloning fails" {
	local existingRemoteRepo="https://example.com/gh-rija/ssg-test-output-NOTEXIST.git"
	run create_dir_for_repo "tests/myrepo" $existingRemoteRepo	
	[[ "$output" =~ "try cloning $existingRemoteRepo" ]]
	[ ! -d "tests/myrepo" ]
	[[ "$output" =~ "fatal: repository" ]]
	[ $status -ne 0 ]


}