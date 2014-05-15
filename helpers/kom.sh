#!/bin/bash

# Kafka Offset Monitor 

KOM_DIR=/opt/kom
ZK_IP=192.168.33.20

cd $KOM_DIR 

java -cp $KOM_DIR/KafkaOffsetMonitor \
     com.quantifind.kafka.offsetapp.OffsetGetterWeb \
     --zk $ZK_IP \
     --port 8080 \
     --refresh 10.seconds \
     --retain 2.days &
