#!bin/bash

echo "update package.. "
sudo apt-get update

echo "upgrade package.. "
sudo apt-get upgrade -y

echo "remove package not use.. "
sudo apt-get autoremove -y

echo "finish!"
