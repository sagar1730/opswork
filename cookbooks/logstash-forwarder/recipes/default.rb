#
# Cookbook Name:: logstash-forwarder
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file '/usr/local/bin/logstash-forwarder_install.sh' do
  source 'logstash-forwarder_install.sh'
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

execute 'logstash-forwarder_install.sh' do
  command 'bash /usr/local/bin/logstash-forwarder_install.sh'
  user 'root'
end

template '/etc/lf/logstash-forwarder/lf.conf' do
  source 'lf.conf.erb'
  owner 'root'
  group 'root'
  mode '0777'
end