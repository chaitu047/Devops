#!/bin/bash

line="x-user"

while [ $line!='#' ]
do
    echo ""
    read -p line "Enter username:"
    useradd $line
    passwd $line
    echo ""
    read -p line "Enter # to stop:"
done

