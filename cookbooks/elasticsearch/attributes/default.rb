# Encoding: utf-8


default['elastic']['version']         = '1.5.2'
default['elastic']['source_url']     = 'http://packages.elastic.co/elasticsearch/1.5/debian'
default['elastic']['component']      =  %w(stable main)
default['elastic']['key']            = 'https://packages.elastic.co/GPG-KEY-elasticsearch'
default['elastic']['apt']['action']  = :add


# Elasticsearch.yml file core configurations. 

#default['elasticsearch']['cluster_name']                           = 'elasticsearch'

default['elasticsearch']['cors']['enabled']                         = 'true'
default['elasticsearch']['cors']['allow-origin']                    = '*'    #Make it double quoted in elasticsearch.yml.erb file
default['elasticsearch']['multicast']['enabled']                    = 'false'

#default['elasticsearch']['unicast_hosts']                          = '[]'
#default['elasticsearch']['number_of_shards']                       = '5'
#default['elasticsearch']['number_of_replicas']                     = '1'