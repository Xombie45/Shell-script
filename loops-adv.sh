#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/shell-script-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ];
then
    echo -e "$R ERROR :: Please run with root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "$R Installing $2 ....... FAILURE $N"
        exit 1
    else
        echo -e "$G Installing $2 ....... SUCCESS $N"
    fi
}

for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo -e "$Y $i is not installed $N . $G Lets Install it $N"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi
done