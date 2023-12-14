#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/var/log/$0-$TIMESTAMP.log"
FILENAME="package.txt"


R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo -e "Installation $R failed $N" &>> $LOGFILE
        exit 1
    else
        echo -e "$2 is $G success $N" &>> $LOGFILE
    fi
    
}

if [ $(id -u) -ne 0 ]
then
    echo "ERROR:: Current user is not root user"
    exit 1
fi

VALIDATE $? "Root user validation"

while read packageName
do 
    yum list installed $packageName

    if [ $? -ne 0 ]
    then
        yum install $packageName -y &>> $LOGFILE
        
        VALIDATE $0 "Installation of $packageName"
    else
        echo "$packageName is already installed" &>> $LOGFILE
    fi

done < $FILENAME