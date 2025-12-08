#!/bin/bash

echo "ALL variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "The name of the script used :$0"
echo "The current working directory of the sciprt:$PWD"
echo "The home directory of the script used $HOME"
echo "the user of the directory $USER"
echo "The PID of the script is $$"

sleep 50 &

echo "The pid of the process running in background" $!