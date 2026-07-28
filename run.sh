#!/bin/bash
DEST_DIR=task5

set -ex
cd /opt 

if [ -d "$DEST_DIR" ]; then
    rm -rf "$DEST_DIR"
fi
git clone https://github.com/AlexBerko/shvirtd-example-python.git "$DEST_DIR" && cd "$DEST_DIR"

docker compose up -d 