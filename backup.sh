#!/bin/bash
BACKUP_DIR="/opt/backup"

set -ex

if [ ! -f ".env" ]; then
    echo "Error: File .env doesn't exist."
    exit 1
fi

source .env 
now=$(date +"%s_%Y-%m-%d")

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi

docker run \
    --rm --entrypoint "" \
    -v "$BACKUP_DIR":/backup \
    --network="task5_backend" \
    mysql:8.0 \
    mysqldump --opt -h 172.20.0.10 -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" --result-file=/backup/"$now"_"$MYSQL_DATABASE".sql "$MYSQL_DATABASE"
