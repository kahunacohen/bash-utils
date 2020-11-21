#!/usr/bin/env bash

### Increments the part of the string
## $1: version itself
## $2: number of part: 0 – major, 1 – minor, 2 – patch
function bump_version {
    declare version=${1:-$(</dev/stdin)};
      declare part=${2:-$(</dev/stdin)};
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
