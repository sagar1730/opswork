default['kibana']['apt']['uri'] = 'http://packages.elastic.co/kibana/4.1/debian'
default['kibana']['apt']['components'] = %w(stable main)
default['kibana']['apt']['key'] = 'https://packages.elasticsearch.org/GPG-KEY-elasticsearch'
default['kibana']['apt']['action'] = :add

#Kibana configuration attributes
default['kibana']['conf']['port'] = 5601
default['kibana']['conf']['host'] = '0.0.0.0'
#default['kibana']['conf']['elasticsearch_url'] = 'http://internal-ElasticSearch-ELB-COPY-900509891.us-west-2.elb.amazonaws.com' 
#default['kibana']['conf']['elasticsearch_port'] = 9200
default['kibana']['conf']['kibana_index'] = '.kibana'

default['kibana']['conf_file'] = '/opt/kibana/config/kibana.yml'