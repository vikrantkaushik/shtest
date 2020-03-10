#!/bin/sh

# take repo name from command line
repo_name=$1
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1
SITE_REPO_URL=https://github.com/lakhanyawa/$repo_name
git ls-remote "$SITE_REPO_URL" > /dev/null 2>&1
if [ "$?" -ne 0 ]; then
    echo "[ERROR] Unable to read from '$SITE_REPO_URL'"
    echo "creating this repository"
    echo -n "Do You Want To Create Admin Repo (y/n)? "
    old_stty_admin=$(stty -g)
    stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_admin # Careful playing with stty
    if echo "$answer" | grep -iq "^y" ;then
       curl -u 'lakhanyawa:lakhan@lakhan@157' https://api.github.com/user/repos -d "{\"name\":\"$repo_name"admin"\"}"
       mkdir $repo_name"admin"
       cd $repo_name"admin"
       echo test > README.md
       git init
       git add .
       git commit -m "learning git repository"
       git remote add origin https://github.com/lakhanyawa/$repo_name"admin"
       git push -u origin master
       git checkout -b dev
       git commit -a -m "created dev branch"
       git push  --mirror
    else
      echo "We are not creating admin branch as per users response"
    fi
    echo -n "Do You Want To Create osadmin Repo (y/n)?"
    old_stty_osadmin=$(stty -g)
    stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_osadmin # Careful playing with stty
    if echo "$answer" | grep -iq "^y" ;then
       curl -u 'lakhanyawa:lakhan@lakhan@157' https://api.github.com/user/repos -d "{\"name\":\"$repo_name"osadmin"\"}"
       mkdir $repo_name"osadmin"
       cd $repo_name"osadmin"
       echo test > README.md
       git init
       git add .
       git commit -m "learning git repository"
       git remote add origin https://github.com/lakhanyawa/$repo_name"osadmin"
       git push -u origin master
       git checkout -b dev
       git commit -a -m "created dev branch"
       git push  --mirror
    else
      echo "We are not creating osadmin branch as per users response"
    fi
    echo -n "Do You Want To Create devops Repo (y/n)?"
    old_stty_devops=$(stty -g)
    stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_devops # Careful playing with stty
    if echo "$answer" | grep -iq "^y" ;then
       curl -u 'lakhanyawa:lakhan@lakhan@157' https://api.github.com/user/repos -d "{\"name\":\"$repo_name"devops"\"}"
       mkdir $repo_name"devops"
       cd $repo_name"devops"
       echo test > README.md
       git init
       git add .
       git commit -m "learning git repository"
       git remote add origin https://github.com/lakhanyawa/$repo_name"devops"
       git push -u origin master
       git checkout -b dev
       git commit -a -m "created dev branch"
       git push  --mirror
    else
      echo "We are not creating osadmin branch as per users response"
    fi
else
        echo "Repository already present"
fi

#repo-check=`git ls-remote https://github.com/lakhanyawa/test`
