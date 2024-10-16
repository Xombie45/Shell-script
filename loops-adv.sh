#!/bin/bash

DATE=$(date)
LOGSDIR=/home/centos/shell-script-logs
SCRIPTNAME=$0
LOGFILE=$LOGSDIR/$0:$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR :: Please run with root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Installing $2 ....... $R FAILURE $N"
        exit 1
    else
        echo "Installing $2 ....... $G SUCCESS $N"
    fi
}

for i in $@
do
    yum list installed $i &>>LOGFILE
    if [ $? -ne 0 ]
    then
        echo "$i is $Y not installed $N . Lets Install it"
        yum install $i -y &>>LOGFILE
        VALIDATE $? "$i"
    else
        echo "$i $Y is already installed $N"
    fi
done