#!/bin/bash
set -e

echo "*** This script creates and runs the containers starting from the images"

sudo docker run -d --name mongodb --network=host \
	-v "$(pwd)"/configdb:/data/configdb \
	-v "$(pwd)"/db:/data/db mongo:bionic
sudo docker run -d --name lida_server --network=host flask/lida
echo "*** To stop the system call the script_stop.sh script"
