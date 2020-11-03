  #!/bin/bash
  
# This script will restore your mongodb database.
  
HOST='localhost'
PORT='27017'
  
echo "Type the folder name having the binaries example Employees_03Nov2020 you want to restore, followed by [ENTER]:"
read  FOLDER

mongorestore --host ${HOST} --port ${PORT} --username ${MONGO_USERNAME} --password ${MONGO_PASSWD} ${MONGO_BACKUP_PATH}/$FOLDER/

# Check if the procedure had an error or not
if [ $? -eq 0 ]; then
  echo "${MONGO_DATABASE_NAME} was restored successfully"
else
  echo "Errors found, Check the following things stepwise, 1.Mongodb daemon is running? 2.The Environment variables are set correctly."
  exit 1
fi
