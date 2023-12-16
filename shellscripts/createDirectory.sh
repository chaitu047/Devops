#!/bin/bash

dirname=$1

if [ ! -e $dirname ]
then
    mkdir $dirname
else
    echo "dir already exists"
fi