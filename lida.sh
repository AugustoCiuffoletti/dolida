#!/bin/bash


#IMAGES (don't change this)
SERVER_IMAGE=flask/lida
MONGODB_IMAGE=mongo:bionic

error() {
	echo "Usage: ..."
}

SERVER="lida_server"
MONGODB="mongodb"
kill="false"
# Checking user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
# Checking commandline parameters
options=':khl:'
while getopts $options option
do
    case $option in
        k  )    kill="true";;
        l  )    dumpfile=$OPTARG; echo "Not yet implemented...";;
        h  )    error ;;
        \? )    error ;;
    esac
done

shift $(($OPTIND - 1))

if [ $kill = "true" ]
then
	echo "Killing the lida server"
	docker kill $SERVER
	echo "Killing the database"
	docker kill $MONGODB
	echo "Bye"
	exit 0
fi

echo "Launching the lida server"
if ! docker container inspect $SERVER > /dev/null
then
  echo "...need to create it first"
  docker run -d --name $SERVER --network=host $SERVER_IMAGE
else
  docker start $SERVER
fi

echo "Launching the database"
if ! docker container inspect $MONGODB > /dev/null
then
  echo "...need to create it first"
  docker run -d --name $MONGODB --network=host \
	-v "$(pwd)"/configdb:/data/configdb \
	-v "$(pwd)"/db:/data/db \
	$MONGODB_IMAGE
else
  docker start $MONGODB
fi

echo "You Lida sandbox is up and running!"
echo "Access with your browser at http://127.0.0.1:5000"
echo "Kill the sandbox running this command with option -k"

