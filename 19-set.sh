#!bin/bash

set -e 

#error() {

 #   echo "there is an error" $LINENO" command is $BASH_COMMAND"

#}

trap 'echo "there is a error in $LINENO, command is :$BASH_COMMAND"', ERR


echo "hello world"
echo "Before error"
cclakjfljk;
echo "After error"