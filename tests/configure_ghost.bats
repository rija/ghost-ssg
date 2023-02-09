#/usr/sbin/env bats

source ./src/lib/repo_setup.sh

@test "do nothing if ghost configuration file already exists" {
	baseDir=tests
	cp config.production.json.sample tests/config.production.json
	run configure_ghost $baseDir
	[[ $output = "doing nothing, the configuration file already exists" ]]
}