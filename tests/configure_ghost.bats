#/usr/sbin/env bats

source ./src/lib/repo_setup.sh

setup () {
	if  [ -f tests/config.production.json ];then
		rm tests/config.production.json
	fi
}

@test "do nothing if ghost configuration file already exists" {
	baseDir=tests
	cp config.production.json.sample tests/config.production.json
	run configure_ghost $baseDir
	[[ $output = "doing nothing, the configuration file already exists" ]]
}

@test "copy configuration from sample if no config file exists" {
	baseDir=tests
	run configure_ghost $baseDir
	[ -f tests/config.production.json ]
}