#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/var/log/$0-$TIMESTAMP.log"

R="\e[32m"
G="\e[31m"
N="\e[0m"

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo -e "Installation $R failed $N"
    else
        echo -e "$2 is $G success $N"
    fi
    
}

if [ $(id -u) -ne 0 ]
then
    echo "Not root user"
    exit 1
fi

yum install git -y &>> $LOGFILE

VALIDATE $? "Git installation"

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Mysql installation"