#!/bin/bash
set -e

echo "*** This script creates and runs the containers starting from the images"

echo -n "mongodb: "
sudo docker run -d --name mongodb --network=host \
	-v "$(pwd)"/configdb:/data/configdb \
	-v "$(pwd)"/db:/data/db mongo:bionic
echo -n "lida_server: "
sudo docker run -d --name lida_server --network=host flask/lida
echo -n "nginx_proxy: "
sudo docker run -d --name nginx_proxy --network=host \
    -v `pwd`/nginx_conf/:/etc/nginx/conf.d nginx

echo "*** To stop the system call the script_stop.sh script"
