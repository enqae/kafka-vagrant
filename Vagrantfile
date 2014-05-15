# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/precise64"
  #config.vm.url = "https://vagrantcloud.com/hashicorp/precise64/version/2/provider/virtualbox.box"
  config.vm.network "private_network", ip: "192.168.33.20"

  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    # vb.gui = true
 
     # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--memory", "2048"]
   end

  # Install JDK8, scala, sct, git ... 
  config.vm.provision "shell" do |s|
    s.path = "setup/dev-env.sh"
    s.args = "scala-2.10.4  sbt-0.13.2"
  end

  # Install Kafka distribution (includes Zookeeper) 
  config.vm.provision "shell" do |s|
    s.path = "setup/kafka-dist-install.sh"
    s.args = "2.10  0.8.1.1"
  end

  # Setup a bunch of brokers 
  config.vm.provision "shell" do |s|
    s.path = "setup/kafka-brokers.sh"
    s.args = "/opt/kafka  192.168.33.20  3"
  end

  # Tools -> kafkacat 
  config.vm.provision "shell" do |s|
    s.path = "tools/kafkacat.sh"
  end

  # Tools -> kafka Offset Monitor
  config.vm.provision "shell" do |s|
    s.path = "tools/kafka-offset-monitor.sh"
  end

  # Tools -> kafka Web Console (play-2.2.2, H2) 
  config.vm.provision "shell" do |s|
    s.path = "tools/kafka-web-console.sh"
  end

end
