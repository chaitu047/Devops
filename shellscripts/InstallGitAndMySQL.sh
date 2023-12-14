#!/bin/bash

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo "Installation failed"
    else
        echo "$2 is success"
    fi
    
}

if [ $(id -u) -ne 0 ]
then
    echo "Not root user"
    exit 1
fi

yum install git -y

VALIDATE $? "Git installation"

yum install mysql -y

VALIDATE $? "Mysql installation"