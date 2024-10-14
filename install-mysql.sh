#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "Please run this command with root access"
    exit
fi

yum install mysql -y

if [ $? - ne 0 ]
then
    echo "Installation of mysql is failed"
    exit
else
    echo "Installation is Succesfully completed"
fi