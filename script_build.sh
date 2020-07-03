#!/bin/bash
set -e


echo "*** This script builds the image of the lida server as a local image"
echo "*** MUST be run in the build directory of the lida server (where the Dockerfile lives)"

[ ! -f Dockerfile ] && { echo "Wrong directory, no Dockerfile here"; exit 1; }

sudo docker build -t flask/lida .

echo "*** To start the system use script_run.sh"
