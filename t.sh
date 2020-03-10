#!/bin/sh
# take repo name from command line
repo_name="testing_auto"
username=vikrantkaushik
password=Friday#123#123
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1
SITE_REPO_URL=https://github.com/$username/$repo_name
git ls-remote "$SITE_REPO_URL" > /dev/null 2>&1
if [ "$?" -ne 0 ]; then
    echo "[ERROR] Unable to read from '$SITE_REPO_URL'"
    echo "creating this repository"
    curl -u $username:$password https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"
else
        echo "Repository already present"
fi

