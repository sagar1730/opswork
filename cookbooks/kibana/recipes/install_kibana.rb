#cookbook_file '/usr/local/bin/install.sh' do
#  source 'install.sh'
#  owner 'root'
#  group 'root'
#  mode '0777'
#  action :create
#end

#execute 'install.sh' do
#  command 'bash /usr/local/bin/install.sh'
#  user 'root'
#end

#template '/opt/kibana/config/kibana.yml' do
#  source 'kibana.conf.erb'
#  owner 'root'
#  group 'root'
#  mode '0777'
#end

apt_repository 'kibana' do
    uri node['kibana']['apt']['uri']
    components node['kibana']['apt']['components']
    key node['kibana']['apt']['key']
    action node['kibana']['apt']['action']
end

package 'kibana' do
# version 1.0
  action :install
end

service 'kibana' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end