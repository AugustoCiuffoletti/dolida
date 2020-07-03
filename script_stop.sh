#!/bin/bash
set -e


echo "*** This script stops and removes the running containers"

sudo docker kill mongodb lida_server
sudo docker rm mongodb lida_server

echo "*** To restart them use the script_run.sh script"
