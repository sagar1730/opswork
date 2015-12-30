# Encoding: utf-8


# Default logstash instance variables
default['logstash']['basedir'] = '/opt/logstash'
#default['logstash']['instance_default']['user'] = 'logstash'
#default['logstash']['instance_default']['group'] = 'logstash'


default['logstash']['version']        = '2.1.0'
default['logstash']['source_url']     = 'http://packages.elastic.co/logstash/2.1/debian'
default['logstash']['component']      =  %w(stable main)
default['logstash']['key']            = 'https://packages.elastic.co/GPG-KEY-elasticsearch'
default['logstash']['apt']['action']  = :install

#default['logstash']['beats']['port'] = '5000'
#default['logstash']['beats']['type'] = 'syslogs'
default['logstash']['beats']['ssl']  = 'false'

# Revise the syntax for bootstrap_servers.
#default['logstash']['kafka']['bootstrap_servers'] = "internal-KafkaELB-COPY-923329219.us-west-2.elb.amazonaws.com:9092 , internal-KafkaELB-COPY-923329219.us-west-2.elb.amazonaws.com:9093 , internal-KafkaELB-COPY-923329219.us-west-2.elb.amazonaws.com:9094"
#default['logstash']['kafka']['topic_id'] = 'minjar'
default['logstash']['kafka']['client_id']= ''
#default['logstash']['log_file']   = 'logstash.log'
#default['logstash']['java_home']  = '/usr/lib/jvm/java-6-openjdk' # openjdk6 on ubuntu
#default['logstash']['conf_dir']   = '/etc/logstash/conf.d/logstash.conf'