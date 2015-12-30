#!/bin/bash

cd /home/ubuntu/kafka/kafka* && sudo bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 1 --topic minjar > /home/ubuntu/kafka/kafka_configure.log