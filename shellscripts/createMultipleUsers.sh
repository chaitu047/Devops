#!/bin/bash

line="x-user"

while [ $line != '#' ]
do
    read -p 'Enter username:' line
    id $line

    if [ $? -eq 0 ]
    then
        echo "User $line already exists"
        exit 1
    fi

    read -p "Enter password" password
    useradd -m -p $(openssl passwd -1 $password) $line
    echo ""
    read -p 'Enter # to stop' line
done