#!/bin/bash 

if [ "$#" -ne 2 ]; then
    echo "Usage: kafka-dist-install.sh SCALA_VERSION KAFKA_VERSION"
    echo "ie.: kafka-dist-install.sh 2.10 0.8.1.1"
    exit 1
fi

scala_version=$1
kafka_version=$2
#scala_version=2.10
#kafka_version=0.8.1.1

apache_repo=http://www.eu.apache.org/dist/kafka
kafka_repo=$apache_repo/$kafka_version
kafka_release=kafka_$scala_version-$kafka_version

# Download Kafka
cd /tmp
wget $kafka_repo/$kafka_release.tgz
tar xvf $kafka_release.tgz
rm $kafka_release.tgz

# Move Kafka to its place
sudo mkdir -p /opt/apache
sudo mv $kafka_release /opt/apache/$kafka_release 

sudo ln -s /opt/apache/$kafka_release  /opt/kafka 
sudo chown -R vagrant:vagrant /opt/kafka

