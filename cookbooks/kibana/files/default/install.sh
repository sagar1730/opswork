#!/bin/bash
#Nginx installation
sudo apt-get update -y
sudo apt-get -y install nginx apache2-utils

#Kibana installation
echo 'deb http://packages.elastic.co/kibana/4.1/debian stable main' | sudo tee /etc/apt/sources.list.d/kibana.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D27D666CD88E42B4
sudo apt-get update -y
sudo apt-get --yes --force-yes install kibana
sudo update-rc.d kibana defaults 96 9
sudo service kibana start