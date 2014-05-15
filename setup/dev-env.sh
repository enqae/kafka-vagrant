#!/bin/bash 

if [ "$#" -ne 2 ]; then
    echo "Usage: dev-env.sh SCALA_VERSION SBT_VERSION"
    echo "ie.: dev-env.sh scala-2.10.4 sbt-0.13.2"
    exit 1
fi

SCALA_RELEASE=$1.deb
SBT_RELEASE=$2.deb
#SCALA_RELEASE=scala-2.10.4.deb
#SBT_RELEASE=sbt-0.13.2.deb

sudo apt-get -y update

# Helper to instal JDK 8
sudo apt-get -y install python-software-properties

#FIX- requiring libansi-native-java 
sudo apt-get -y install libjansi-native-java  libhawtjni-runtime-java libjansi-java

# JDK8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo  debconf-set-selections
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true | sudo  debconf-set-selections

sudo apt-get -y install oracle-java8-installer

# scala
cd /tmp
wget http://www.scala-lang.org/files/archive/$SCALA_RELEASE
DEBIAN_FRONTEND=noninteractive
sudo dpkg --install $SCALA_RELEASE 

# sbt
wget http://dl.bintray.com/sbt/debian/$SBT_RELEASE
DEBIAN_FRONTEND=noninteractive 
sudo dpkg --install $SBT_RELEASE

#cleanup
sudo rm -rf /tmp/$SCALA_RELEASE
sudo rm -rf /tmp/$SBT_RELEASE

# Others
sudo apt-get -y install git
sudo apt-get -y install unzip
