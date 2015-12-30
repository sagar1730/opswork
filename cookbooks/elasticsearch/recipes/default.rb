

# Install Oracle Java 8.0 through script.

include_recipe 'java::default'

# Add PPA in apt repository
apt_repository 'elasticsearch' do
 uri node['elastic']['source_url'] 
 components node['elastic']['component']
 key node['elastic']['key']
 action :add
end


package 'elasticsearch' do
  action :install
end

include_recipe 'elasticsearch::config'

service 'elasticsearch' do
  supports :status => true, :restart => true, :reload => true
   action [:start, :enable]
end


# Installs Head plugin
bash 'Head_plugin' do
  user 'root'
  cwd '/usr/share/elasticsearch/bin'
  code <<-EOH
    chmod 777 /usr/share/elasticsearch/plugins
    ./plugin install mobz/elasticsearch-head
  EOH
  action :run
end


#execute 'elasticsearch' do
#  command 'sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -d -p /var/run/elasticsearch.pid --default.config=/etc/elasticsearch/elasticsearch.yml --default.path.home=/usr/share/elasticsearch --default.path.logs=/var/log/elasticsearch --default.path.data=/var/lib/elasticsearch --default.path.work=/tmp/elasticsearch --default.path.conf=/etc/elasticsearch'
#end	

# Start the logstash service.
# service 'elasticsearch' do
#  supports :status => true, :restart => true, :reload => true, :start => true
#  action [:start, :enable]
#end
