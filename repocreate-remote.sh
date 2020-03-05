#!/bin/sh

# take repo name from command line
repo_name=$1
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

#check repo is exist on remote github or not
repo-check=`git ls-remote https://github.com/lakhanyawa/test`

curl -u 'lakhanyawa' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"

