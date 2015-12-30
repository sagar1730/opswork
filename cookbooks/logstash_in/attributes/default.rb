# Encoding: utf-8
# Author       : Sagar Ghuge
# Organization : Minjar Cloud Solutions


# Logstash Installation parameters. To change the version in future just change version number and source_url. 
default['logstash']['version']        = '2.1.0'
default['logstash']['source_url']     = 'http://packages.elastic.co/logstash/2.1/debian'
default['logstash']['component']      =  %w(stable main)
default['logstash']['key']            = 'https://packages.elastic.co/GPG-KEY-elasticsearch'
default['logstash']['apt']['action']  = :install

#Logstash takes input from Kafka. Change Input configuration here.
#default['logstash']['kafka']['zk_connect'] = 'internal-KafkaELB-COPY-923329219.us-west-2.elb.amazonaws.com:2181'
#default['logstash']['kafka']['group_id'] = 'syslogs'
#default['logstash']['kafka']['type']  = 'logs'
#default['logstash']['kafka']['topic_id'] = 'minjar'

# Logstash Output Logs to the Elasticsearch on its ELB. Change output configuration here.
#default['logstash']['elastic']['hosts'] = 'internal-ElasticSearch-ELB-COPY-900509891.us-west-2.elb.amazonaws.com'
