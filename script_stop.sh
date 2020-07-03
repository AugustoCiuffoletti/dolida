#!/bin/bash
#set -e

echo "*** This script stops and removes the running containers"

sudo docker kill mongodb lida_server nginx_proxy
sudo docker rm mongodb lida_server nginx_proxy

echo "*** To restart them use the script_run.sh script"
