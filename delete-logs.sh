#!/bin/bash

APP_LOGS_DIR=/home/centos/shell-script

DATE=$(date)
LOGSDIR=/home/centos/shell-script-logs
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "LOGFILE" -type f -mtime +14)

echo "script started executing at $DATE" &>>$LOGFILE

while read line
do
    echo "Deleting $line" &>>$LOGFILE
    rm -rf $line
done <<< $FILES_TO_DELETE
