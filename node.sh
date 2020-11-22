#! /usr/bin/env bash

# Modifies package.json version.
# $1 - The version
function mod_package_json {
    jq ".version=\"$1\"" ./package.json
    #> package.json.tmp && mv package.json.tmp package.json && \  git commit ./package.json -m "Mutate version key in package.json to $1" && \
 }
