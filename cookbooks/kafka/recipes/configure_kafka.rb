
template '/usr/local/bin/kafka_2.11-0.8.2.1/config/server.properties' do
  source 'server.properties.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/usr/local/bin/kafka_2.11-0.8.2.1/config/server1.properties' do
  source 'server1.properties.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/usr/local/bin/kafka_2.11-0.8.2.1/config/server2.properties' do
  source 'server2.properties.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

execute 'start_kafka_broker_1' do
  command 'sudo nohup bin/kafka-server-start.sh config/server.properties > output.out 2> error.err < /dev/null &'
  cwd node['kafka']['cwd']
  creates '/usr/local/bin/kafka_2.11-0.8.2.1/output.out'
  action :run
end

execute 'start_kafka_broker_2' do
  command 'sudo nohup bin/kafka-server-start.sh config/server1.properties > output1.out 2> error1.err < /dev/null &'
  cwd node['kafka']['cwd']
  creates '/usr/local/bin/kafka_2.11-0.8.2.1/output1.out'
  action :run
end

execute 'start_kafka_broker_3' do
  command 'sudo nohup bin/kafka-server-start.sh config/server2.properties > output2.out 2> error2.err < /dev/null &'
  cwd node['kafka']['cwd']
  creates '/usr/local/bin/kafka_2.11-0.8.2.1/output2.out'
  action :run
end

execute 'configure_kafka_topic' do
  command node['kafka']['topic_create']
  cwd node['kafka']['cwd']
  creates '/usr/local/bin/kafka_2.11-0.8.2.1/kafka_configure.log'
  action :run
#  retries 3
#  retry_delay 45
end