#!/bin/bash

echo "Create multiple users"

while true
do
echo "Enter username and password"

read -p "Enter username:" username

read -s "Enter password:" password

read -p "Enter expiration days:" days

id $username

if [ $? -eq 0 ]
then
    echo "User already exists"
else
    useradd -m -p $(openssl passwd -1 $password) -e $(date -d "+$days days" +%Y-%m-%d) $username

    if [ $? -eq 0 ]
    then
        echo "User successfully created"
    fi
fi

read -p "Enter (y/n)" choice

if [ $choice != "y" ]
then
    echo "stopping..."
    break
fi

done