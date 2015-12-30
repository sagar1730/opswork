

# Install Oracle Java 8.0 throuh Java Cookbook.

include_recipe 'java::default'

# Add PPA in apt repository
apt_repository 'logstash' do
 uri node['logstash']['source_url'] 
 components node['logstash']['component']
 key node['logstash']['key']
 action :add
end

package 'logstash' do
  action :install
end

topic = node['logstash_out']['topic_id']
portno = node['logstash_out']['port']
logtype = node['logstash_out']['type']
servers = node['logstash_out']['bootstrap_servers']

template '/etc/logstash/conf.d/logstash.conf' do
  source 'logstash.conf.erb'
  variables(:port => portno,
  	        :type => logtype,
  	        :bootstrap_servers => servers,
  	        :topic_id => topic
  	        ) 
  owner 'root'
  group 'root'
  mode '0777'                             # Other permission won't work on AWS environment.
 #notifies :restart, "service[logstash]"
end

execute 'logstash' do
 command 'nohup /opt/logstash/bin/logstash -f /etc/logstash/conf.d/logstash.conf &'
end

# Start the logstash service.
#service 'logstash' do
#  supports :status => true, :restart => true, :reload => true, :start => true
#  action [:start, :enable]
#end
