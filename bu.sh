#!/usr/bin/env bash

# Git
alias gd='git diff'
alias gp='git push'
alias gs='git status'
alias git_branch_ls='git branch --sort=-committerdate'

function gca {
  git commit -am "$1"
}

function gcap {
  gca $1 && gp
}

### Increments the part of the string
## $1: version itself
## $2: part: major, minor, patch
function bump_version {
  declare part=${1:-$(</dev/stdin)};
  declare version=${2:-$(</dev/stdin)};
  local i=2 # Default is patch
  if [ "major" == "$part" ]; then i=0; fi
  if [ "minor" == "$part" ]; then i=1; fi
  local delimiter=.
  local array=($(echo "$version" | tr $delimiter '\n'))
  array[$i]=$((array[$i]+1))
  if [ $i -lt 2 ]; then array[2]=0; fi
  if [ $i -lt 1 ]; then array[1]=0; fi
  echo $(local IFS=$delimiter ; echo "${array[*]}")
}

# Gets the latest tag in a git repo
function latest_tag {
  git tag | sort -V | head -n1
}

# Bumps the latest tag in a git repo
# printing it to stdout. Does not
# create or push any tags.
# $1 major|minor|patch
# E.g.
# $ bump_tag minor
function bump_latest_tag {
  latest_tag | bump_version $1
}

# Bump latest tag, created annotated tag and push the
# tag.
# $1: major|minor|patch
# $1: Commit message.
function bump_tag_push {
  git tag -a $(bump_latest_tag $1) -m "$2"
  git push --tags
 }
# Outputs package.json version with new version
# $1 - The path to package.json. E.g. ./
# $2 - The version
function mod_package_json {
    jq ".version=\"$2\"" $1/package.json
}

# Kills a port by port number.
# $1: The port number.
function kill_port {
  kill $(lsof -t -i :$1)
}

#function kill_ports {
#  local ports=(1337 8080 4200)
#  for i in "${ports[@]}"
#    do
#    :
#    x=$(lsof -t -i :$i)
#    kill $x
#  } 
