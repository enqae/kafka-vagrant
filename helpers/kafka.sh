#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: kafka.sh BROKERS"
    echo "ie.: kafka.sh 3"
    exit 1
fi

KAFKA_DIR=/opt/kafka
BROKERS=$1

cd $KAFKA_DIR

# Startup Brokers
for ((i=1;i<=$BROKERS;i++))
do
   bin/kafka-server-start.sh config/server-$i.properties 1>> /tmp/broker-$i.log 2>> /tmp/broker-$i.log &
done

