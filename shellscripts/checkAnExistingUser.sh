#!/bin/bash

user=$1

if [ $(whoami) -eq 'root' ]
then
    echo "root user"
fi
