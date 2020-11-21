#!/usr/bin/env bash

### Increments the part of the string
## $1: version itself
## $2: number of part: 0 – major, 1 – minor, 2 – patch
function bump_version {
  declare version=${1:-$(</dev/stdin)};
  declare part=${2:-$(</dev/stdin)};
  local delimiter=.
  local array=($(echo "$version" | tr $delimiter '\n'))
  array[$2]=$((array[$part]+1))
  if [ $2 -lt 2 ]; then array[2]=0; fi
  if [ $2 -lt 1 ]; then array[1]=0; fi
  echo $(local IFS=$delimiter ; echo "${array[*]}")
}
