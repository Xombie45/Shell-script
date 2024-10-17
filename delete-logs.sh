#!/bin/bash

APP_LOGS_DIR=/home/centos/shell-script-logs

DATE=$(date)
LOGSDIR=/home/centos/shell-script-logs
# /home/centos/shell-script-logs/script-name-date.log 
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "script started executing at $DATE" &>>$LOGFILE

while read line
do
    echo "Deleting $line" &>>$LOGFILE
    rm -rf $line
done <<< $FILES_TO_DELETE
