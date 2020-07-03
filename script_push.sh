#!/bin/bash
set -e

echo "*** This script pushes the current Lida server to the Docker.io hub"

sudo docker tag flask/lida mastrogeppetto/dockerlida:latest
sudo docker push mastrogeppetto/dockerlida

echo "*** To use the new version from the server you need to use the script_run_hub.sh script"
