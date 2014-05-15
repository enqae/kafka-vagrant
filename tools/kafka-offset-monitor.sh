#!/bin/bash

# Kafka Offset Monitor 
KOM_DIR=/opt/kom
KOM_APP=KafkaOffsetMonitor
KOM_TARGET=KafkaOffsetMonitor-assembly-0.2.0.jar

cd /tmp

wget https://github.com/quantifind/KafkaOffsetMonitor/releases/download/v0.2.0/$KOM_TARGET

sudo mkdir -p $KOM_DIR

sudo mv $KOM_TARGET $KOM_DIR
sudo ln -s $KOM_DIR/$KOM_TARGET $KOM_DIR/$KOM_APP 
sudo chown -R vagrant:vagrant $KOM_DIR 

