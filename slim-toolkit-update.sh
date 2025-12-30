#!/usr/bin/env bash

curl -L https://github.com/slimtoolkit/slim/releases/download/1.40.11/dist_linux.tar.gz --output dist_linux.tar.gz
tar -vxzf dist_linux.tar.gz
sudo mv dist_linux/* /usr/local/bin/.
if [[ ! -d dist_linux ]] then
    echo 'Directory dist_linux not exist!'
    exit 1
fi

if [[ -z `ls dist_linux` ]] then
    rm -rf dist_linux
else
    echo 'Directory dist_linux is not empty!'
    exit 1
fi


if [[ -f dist_linux.tar.gz ]] then
    rm dist_linux.tar.gz
    exit 0
fi

echo 'dist_linux.tar.gz not exist!'

