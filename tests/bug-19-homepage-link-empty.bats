#!/usr/bin/env bats

setup () {
	./preview 1> /dev/null
}

@test "link to homepage on other page is not empty" {
	link=$(docker-compose run --rm export sh -c "wget -qO- http://preview/404/" | grep "gh-head-logo" | cut -d"=" -f3)
	[[ $link =~ http://localhost:9999 ]]
}