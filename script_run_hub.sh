#!/bin/bash
set -e

echo "*** This script creates and runs the containers starting from the images"

sudo docker run -d --name mongodb --network=host \
	-v `pwd`/configdb:/data/configdb \
	-v `pwd`/db:/data/db mongo:bionic
sudo docker run -d --name lida_server --network=host mastrogeppetto/dockerlida:latest
sudo docker run -d --name nginx_proxy --network=host \
    -v `pwd`/nginx_conf/:/etc/nginx/conf.d nginx
echo "*** To stop the system call the script_stop.sh script"
