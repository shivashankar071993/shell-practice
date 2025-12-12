#!bin/bash

set -e 

error() {

    echo "there is an error" $LINENO" command is $BASH_COMMAND"

}

trap error ERR


echo "hello world"
echo "Before error"
cclakjfljk;
echo "After error"