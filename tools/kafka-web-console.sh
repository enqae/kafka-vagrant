#!/bin/bash

# Kafka Web Console
KWC_DIR=/opt/kwc
PLAY_VER=play-2.2.2
KWC_APP=kafka-web-console

cd /tmp

# Download play and kafkaWebConsole
wget http://downloads.typesafe.com/play/2.2.2/$PLAY_VER.zip
unzip $PLAY_VER.zip

git clone https://github.com/claudemamo/$KWC_APP.git
cd $KWC_APP

# Build kafkaWebConsole
../$PLAY_VER/play dist

# Deploy kafkaWebConsole 
KWC_TARGET_ZIP=`ls target/universal/kafka-web-console*`
KWC_TARGET=`basename "$KWC_TARGET_ZIP" | sed 's/.zip//'`

sudo mkdir -p $KWC_DIR
sudo unzip $KWC_TARGET_ZIP -d $KWC_DIR
sudo ln -s $KWC_DIR/$KWC_TARGET $KWC_DIR/$KWC_APP
sudo chown -R  vagrant:vagrant $KWC_DIR

# Cleanup
cd /tmp
sudo rm -rf $PLAY_VER* sbt*
sudo rm -rf $KWC_APP
