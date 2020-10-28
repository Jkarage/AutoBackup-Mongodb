#!/bin/bash
 
export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=`date +"%d%b%Y"`
 
HOST='localhost'
PORT='27017'
 
# Create a directory where backups are stored
mkdir -p ${MONGO_BACKUP_PATH}

# Displaying the begining of the backup procedure
echo "Starting Backup for database - ${MONGO_DATABASE_NAME}"

# Using the mongodump tool to dump the database into a file
mongodump --host ${HOST} --port ${PORT} --db ${MONGO_DATABASE_NAME} --username ${MONGO_USERNAME} --password ${MONGO_PASSWD} --out ${MONGO_BACKUP_PATH}/${MONGO_DATABASE_NAME}_${TODAY}


# Check if the procedure had an error or not
if [ $? -eq 0 ]; then
  echo "${MONGO_DATABASE_NAME} backup successfully completed"
else
  echo "Errors found, Check the following things stepwise, 1.Mongodb daemon is running? 2.The Environment variables are set correctly."
  exit 1
fi
