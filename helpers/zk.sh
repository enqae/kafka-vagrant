#!/bin/bash

KAFKA_DIR=/opt/kafka

cd $KAFKA_DIR

# Startup Zookeeper
bin/zookeeper-server-start.sh config/zookeeper.properties 1>> /tmp/zk.log 2>> /tmp/zk.log &

