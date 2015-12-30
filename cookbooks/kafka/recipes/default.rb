#
# Cookbook Name:: kafka
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#cookbook_file '/usr/local/bin/kafka_install.sh' do
#  source 'kafka_install.sh'
#  owner 'root'
#  group 'root'
#  mode '0755'
#  action :create
#end

#execute 'kafka_install.sh' do
#  command 'bash /usr/local/bin/kafka_install.sh'
#  user 'root'
#end

#cookbook_file '/usr/local/bin/kafka_configure.sh' do
#  source 'kafka_configure.sh'
#  owner 'root'
#  group 'root'
#  mode '0755'
#  action :create
#end

#execute 'kafka_configure.sh' do
#  command 'bash /usr/local/bin/kafka_configure.sh'
#  user 'root'
#end

include_recipe 'kafka::install_kafka'
include_recipe 'kafka::configure_kafka'

