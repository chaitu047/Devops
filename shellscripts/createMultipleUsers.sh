#!/bin/bash

line="x-user"

while [ $line!='#' ]
do
    read -p line "Enter username: "
    useradd $line
    passwd $line
    read line
done

