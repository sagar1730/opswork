#!/bin/bash

sudo mkdir  /home/ubuntu/kafka
sudo apt-get -y update
sudo apt-get -y install default-jre
sudo apt-get -y install zookeeperd
cd /home/ubuntu/kafka
sudo wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
sudo tar -xvzf kafka*.tgz

sudo rm -rf kafka*.tgz

cd /home/ubuntu/kafka/kafka*/config && sudo touch server1.properties

sudo cat <<EOF > /home/ubuntu/kafka/kafka*/config/server1.properties

############################# Server Basics #############################

broker.id=1

############################# Socket Server Settings #############################

port=9093

# The number of threads handling network requests
num.network.threads=3
 
# The number of threads doing disk I/O
num.io.threads=8

# The send buffer (SO_SNDBUF) used by the socket server
socket.send.buffer.bytes=102400

# The receive buffer (SO_RCVBUF) used by the socket server
socket.receive.buffer.bytes=102400

# The maximum size of a request that the socket server will accept (protection against OOM)
socket.request.max.bytes=104857600


############################# Log Basics #############################

# A comma seperated list of directories under which to store log files
log.dirs=/tmp/kafka-logs-1

num.partitions=1

num.recovery.threads.per.data.dir=1


############################# Log Retention Policy #############################

log.retention.hours=168

log.segment.bytes=1073741824

log.retention.check.interval.ms=300000

log.cleaner.enable=false

############################# Zookeeper #############################

zookeeper.connect=localhost:2181

zookeeper.connection.timeout.ms=6000

EOF

cd /home/ubuntu/kafka/kafka*/config && sudo touch server2.properties

sudo cat <<EOF > /home/ubuntu/kafka/kafka*/config/server2.properties

############################# Server Basics #############################

broker.id=2

############################# Socket Server Settings #############################

port=9094

# The number of threads handling network requests
num.network.threads=3
 
# The number of threads doing disk I/O
num.io.threads=8

# The send buffer (SO_SNDBUF) used by the socket server
socket.send.buffer.bytes=102400

# The receive buffer (SO_RCVBUF) used by the socket server
socket.receive.buffer.bytes=102400

# The maximum size of a request that the socket server will accept (protection against OOM)
socket.request.max.bytes=104857600


############################# Log Basics #############################

# A comma seperated list of directories under which to store log files
log.dirs=/tmp/kafka-logs-2

num.partitions=1

num.recovery.threads.per.data.dir=1


############################# Log Retention Policy #############################

log.retention.hours=168

log.segment.bytes=1073741824

log.retention.check.interval.ms=300000

log.cleaner.enable=false

############################# Zookeeper #############################

zookeeper.connect=localhost:2181

zookeeper.connection.timeout.ms=6000

EOF

cd /home/ubuntu/kafka/kafka* && sudo nohup bin/kafka-server-start.sh config/server.properties > output.out 2> error.err < /dev/null &

cd /home/ubuntu/kafka/kafka* && sudo nohup bin/kafka-server-start.sh config/server1.properties > output1.out 2> error1.err < /dev/null &

cd /home/ubuntu/kafka/kafka* && sudo nohup bin/kafka-server-start.sh config/server2.properties > output2.out 2> error2.err < /dev/null &

sleep 60