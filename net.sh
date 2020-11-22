#!/usr/bin/env bash

# Kills a port by port number.
# $1: The port number.
function kill_port {
  kill $(lsof -t -i :$1)
}

function kill_ports {
  local ports=(1337 8080 4200)
  for i in "${ports[@]}"
    do
    :
    x=$(lsof -t -i :$i)
    kill $x
  done
}

