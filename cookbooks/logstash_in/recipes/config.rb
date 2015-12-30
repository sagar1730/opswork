
# Configure the logstash file

template '/etc/logstash/conf.d/logstash.conf' do
  source 'logstash.conf.erb'
  owner 'root'
  group 'root'
  mode '0777'                             # Other permission won't work on AWS environment.
# notifies :restart, "service[logstash]"
end