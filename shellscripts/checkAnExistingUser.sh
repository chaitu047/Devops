#!/bin/bash

user=$1

if [ $(whoami)='root' ]
then
    echo "root user"
fi
