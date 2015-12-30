

# Install Oracle Java 8.0 through Java Cookbook.

include_recipe 'java::default'	

# Add PPA in apt repository
apt_repository 'logstash' do
 uri node['logstash']['source_url'] 
 components node['logstash']['component']
 key node['logstash']['key']
 action :add
end

# Install Logstash package. 
package 'logstash' do
  action :install
end

include_recipe 'logstash_in::config'	

# Runs Logstash through configuration file.
execute 'logstash' do
 command 'nohup /opt/logstash/bin/logstash -f /etc/logstash/conf.d/logstash.conf &'
end

# Start the logstash service.
#service 'logstash' do
#  supports :status => true, :restart => true, :reload => true, :start => true
#  action [:start, :enable]
#end
