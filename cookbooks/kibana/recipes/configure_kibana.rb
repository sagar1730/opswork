template node['kibana']['conf_file'] do
  source 'kibana.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[kibana]'
end


#execute 'kibana_start' do
#  command '/etc/init.d/kibana restart'
#  creates '/tmp/something'
#  user 'root'
#  action :run
#end

