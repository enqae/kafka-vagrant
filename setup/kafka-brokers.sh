#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: kafka-brokers.sh KAFKA_DIR ZK_IP BROKERS"
    echo "ie.: kafka-brokers.sh  /opt/kafka  192.168.33.20  2"
    exit 1
fi

KAFKA_DIR=$1
ZOOKEEPER_IP=$2
BROKERS=$3
#KAFKA_DIR=/opt/kafka
#ZOOKEEPER_IP=192.168.33.20
#BROKERS=2

echo $KAFKA_DIR/config
cd $KAFKA_DIR/config

for ((i=1;i<=$BROKERS;i++))
do
   # clean previous configuration
   rm -f server-$i.properties
	
   # BrokerId
   cp server.properties server-$i.properties
   sed -i 's/broker.id=0/'broker.id=$i'/' server-$i.properties 

   # New port for Kafka Broker
   newPort=`expr 9092 + $i`
   sed -i 's/port=9092/'port=$newPort'/' server-$i.properties

   # Log dir for Kafka
   sed -i 's/kafka-logs/'kafka-logs-$i'/' server-$i.properties

   # Zookeeper IP
   sed -i 's/zookeeper.connect=localhost:2181/'zookeeper.connect=$ZOOKEEPER_IP:2181'/' server-$i.properties

done
