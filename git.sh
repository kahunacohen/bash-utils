### Increments the part of the string
## $1: version itself
## $2: number of part: 0 – major, 1 – minor, 2 – patch
# Riff on https://stackoverflow.com/questions/8653126/how-to-increment-version-number-in-a-shell-script/17364637#64390598

#  declare part=${1:-$(</dev/stdin)};
#  declare ver=${2:-$(</dev/stdin)};
bump_version() {
  local delimiter=.
  local array=($(echo "$1" | tr $delimiter '\n'))
  array[$2]=$((array[$2]+1))
  echo $(local IFS=$delimiter ; echo "${array[*]}")
}
