#! /usr/bin/env bash

# Outputs package.json version with new version
# $1 - The path to package.json. E.g. ./
# $2 - The version
function mod_package_json {
    jq ".version=\"$2\"" $1/package.json
}
