package 'default-jre' do
  action :install
end

package 'zookeeperd' do
  action :install
end

service 'zookeeper' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

remote_file '/usr/local/bin/kafka_2.11-0.8.2.1.tgz' do
  source "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
#  checksum node[:program][:checksum]
  notifies :run, "bash[install_kafka]", :immediately
end

bash 'install_kafka' do
  user 'root'
  cwd '/usr/local/bin/'
  code <<-EOH
    tar -zxf kafka_2.11-0.8.2.1.tgz
    rm -rf kafka_2.11-0.8.2.1.tgz
  EOH
  action :nothing
end