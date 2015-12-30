#attributes for server.properties configuration

#default['kafka']['server.properties']['broker.id']	= 0
#default['kafka']['server.properties']['port']		= 9092
#default['kafka']['server.properties']['log.dirs']	= '/tmp/kafka-logs'

#attributes for server1.properties configuration
#default['kafka']['server1.properties']['broker.id']	= 1
#default['kafka']['server1.properties']['port']		= 9093
#default['kafka']['server1.properties']['log.dirs']	= '/tmp/kafka-logs-1'

#attributes for server2.properties configuration
#default['kafka']['server2.properties']['broker.id']	= 2
#default['kafka']['server2.properties']['port']		= 9094
#default['kafka']['server2.properties']['log.dirs']	= '/tmp/kafka-logs-2'

default['kafka']['topic_create']	= 'sleep 60 && bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 1 --topic minjar > /usr/local/bin/kafka_2.11-0.8.2.1/kafka_configure.log'
#default['kafka']['dir_path']		= '/usr/local/bin/'
#default['kafka']['file_name']		= 'kafka_2.11-0.8.2.1.tgz'
default['kafka']['cwd']				= '/usr/local/bin/kafka_2.11-0.8.2.1/'