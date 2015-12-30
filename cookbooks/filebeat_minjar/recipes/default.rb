#
# Cookbook Name:: filebeat_minjar
# Recipe:: default
#
# Copyright 2015, Minjar Cloud Solutions
#
# All rights reserved - Do Not Redistribute
#

apt_repository 'filebeat' do
    uri node['filebeat_minjar']['apt']['uri']
    components node['filebeat_minjar']['apt']['components']
    key node['filebeat_minjar']['apt']['key']
    action :add
end


package 'filebeat' do
#	version 1.1.0
	action :install
	options '--force-yes'
	retries 1
end

log = node['filebeat_minjar']['log_path']
hosts = node['filebeat_minjar']['hosts']
port = node['filebeat_minjar']['port']


template "/etc/filebeat/filebeat.yml" do
  source "filebeat.yml.erb"
  variables(:log_path => log,
  	        :logstash_hosts => hosts,
  	        :logstash_port => port 
  	        )
  owner 'root'
  group 'root'
  mode '0644'
 notifies :restart, "service[filebeat]"
end

service 'filebeat' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end


#include_recipe 'filebeat_minjar::install_package'
#include_recipe 'filebeat_minjar::configure_package'
