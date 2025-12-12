#!bin/bash

set -e 

error() {

    echo "there is an error"

}

trap error ERR


echo "hello world"
echo "Before error"
cclakjfljk;
echo "After error"