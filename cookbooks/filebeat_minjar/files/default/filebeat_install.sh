#!/bin/bash

sudo apt-get install curl

curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.0.0_amd64.deb

sudo dpkg -i filebeat_1.0.0_amd64.deb

sudo cat <<EOF > /etc/filebeat/filebeat.yml 
filebeat:
  prospectors:
    -
      paths:
        - /var/log/*.log
      encoding: plain
      input_type: log
      fields:
        log_type: access
  registry_file: /var/lib/filebeat/registry
output:
  logstash:
    hosts: ["internal-LogStashServer-ELB-COPY-1240043398.us-west-2.elb.amazonaws.com:5000"]
shipper:
logging:
  to_syslog: false
  to_files: true
  files:
    path: /var/log/filebeat
    name: filebeat.log
    rotateeverybytes: 10485760 # = 10MB
  level: info

EOF

sudo /etc/init.d/filebeat restart


sudo update-rc.d filebeat defaults
