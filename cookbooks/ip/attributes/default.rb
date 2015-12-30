#default['filebeat_minjar']['apt']['uri'] = 'https://packages.elastic.co/beats/apt'
default['filebeat_minjar']['apt']['components'] = %w(stable main)
#default['filebeat_minjar']['apt']['key'] = 'https://packages.elasticsearch.org/GPG-KEY-elasticsearch'
#default['filebeat_minjar']['apt']['action'] = :add
#default['filebeat_minjar']['version'] = 1.0.0
#default['filebeat_minjar']['action'] = :install


#attributes for elasticsearch configuration

#default['filebeat_minjar']['elasticsearch']['enabled'] = true
#default['filebeat_minjar']['elasticsearch']['hosts'] = '52.35.55.85'
#default['filebeat_minjar']['elasticsearch']['port'] = 9200

#attributes for logstash configuration

#default['filebeat_minjar']['logstash']['enabled'] = false
#default['filebeat_minjar']['logstash']['hosts'] = 'internal-LogStashServer-ELB-COPY-1240043398.us-west-2.elb.amazonaws.com'
#default['filebeat_minjar']['logstash']['port'] = 5000	

#default['filebeat_minjar']['log_path'] 		= '/var/log/*.log'
#default['filebeat_minjar']['registry_file']	= '/var/lib/filebeat/registry'
#default['filebeat_minjar']['config_dir']	= '/etc/filebeat/conf.d'
#default['filebeat_minjar']['input_log']		= 'log'

#attributes for logging

#default['filebeat_minjar']['logging']['to_syslog'] 	= false
#default['filebeat_minjar']['logging']['to_files'] 	= true
#default['filebeat_minjar']['logging']['files']['path']	= '/var/log/filebeat'
#default['filebeat_minjar']['logging']['files']['name']	= 'filebeat.log'
#default['filebeat_minjar']['logging']['files']['rotateeverybytes']	=	10485760