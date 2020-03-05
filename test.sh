REPO=$1
SITE_REPO_URL=https://lakhanyawa:lakhan@lakhan@157@github.com/lakhanyawa/$REPO
git ls-remote "$SITE_REPO_URL" > /dev/null 2>&1
if [ "$?" -ne 0 ]; then
    echo "[ERROR] Unable to read from '$SITE_REPO_URL'"
    exit 1;
else
	echo "branch is present"
fi
