#!/bin/bash

DATE=$(date)
SCRIPT_NAME=$0
LOGFILES=/tmp/$SCRIPT_NAME-$DATE.log

#Colours

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "$2 $R is......FAILED $N"
    exit 1
else
    echo -e "$2 $R is......SUCCESS $N"
fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this command with root access"
    exit 1
fi

yum install postfix -y &>>$LOGFILES

VALIDATE $? "Installation of postfix"
