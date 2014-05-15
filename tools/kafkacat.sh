#!/bin/bash

sudo apt-get -y install build-essential
sudo apt-get -y install git

# Kafkacat
cd /tmp
git clone https://github.com/edenhill/kafkacat.git
cd kafkacat
./bootstrap.sh
sudo cp kafkacat /usr/local/bin/

cd ..
sudo rm -rf kafkacat
