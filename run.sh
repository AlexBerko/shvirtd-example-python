#!/bin/bash

set -ex
cd /opt && git clone https://github.com/AlexBerko/shvirtd-example-python.git && cd shvirtd-example-python

docker compose up -d 