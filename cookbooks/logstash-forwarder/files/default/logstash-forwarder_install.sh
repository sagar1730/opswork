#!/bin/bash

sudo apt-get update
sudo apt-get -y install golang
sudo apt-get -y install git
sudo mkdir /etc/lf
cd /etc/lf
sudo git clone git://github.com/elasticsearch/logstash-forwarder.git
cd logstash-forwarder
sudo go build
sudo cat <<EOF > /etc/ssl/certs/logstash-forwarder.crt
-----BEGIN CERTIFICATE-----
MIIDbjCCAlagAwIBAgIJANL/UqEh7AVqMA0GCSqGSIb3DQEBCwUAMEUxCzAJBgNV
BAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBX
aWRnaXRzIFB0eSBMdGQwHhcNMTUxMjA3MTQ1NTQ5WhcNMjUxMjA0MTQ1NTQ5WjBF
MQswCQYDVQQGEwJBVTETMBEGA1UECAwKU29tZS1TdGF0ZTEhMB8GA1UECgwYSW50
ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAvyITJ6ngbtfTrjyZS8thvBwYJDisXjkU8tQVs5A4XQ3YJ89PQULnMWgr
TMuM1QWE8tNQeL15V2429c+C9/wDIUuDTZEaOFoGv1Y7iGJxuTVa1isemu0u2k4y
9EI+gXbRA2n6ToBri9+6D8aaqUXa/NjO8Zd4ecrICPRX3o4y9o0u9vYRN7ijL0/9
1ITyv3uPmB1ls1s6ETOTRz22dfhUGwJWrQQDNKZslF/tpBKAaYKTWzCxJ/zk73HZ
QknO96XYGMoFGN3qLog00qgiAcdODDWQ2gGmWeq9sep3HLwoK8cnNxN491hLDZNy
B4ppMAEXJIkPL0oczLhyVKugR7WtHQIDAQABo2EwXzAPBgNVHREECDAGhwSsHgAO
MB0GA1UdDgQWBBStogYpWkw4Mnm5WB994dhoLDNsjjAfBgNVHSMEGDAWgBStogYp
Wkw4Mnm5WB994dhoLDNsjjAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IB
AQCG7C8bgxGM9U1/3y2WvCpyD7xt4R8kxo1Dz2w1OM6RGkR6ro+Yc1RCa71NKlGM
mu+A4wtxiwDN/UqK67yhamvD6cjU/K8Z9hFYqGpw0BbbOrVEbL2/6SBRv20jWSOI
6B7bl96yC7qxTO/qTjE25n+FkrM6Y4TvxgZYCsHKBlSpa0lLds53v7xwaOSdMt5O
xn2jvrwPDlZx26noKKxznLGqoBz8vctwGd8SGy5oc43vCpj9s5yg/Q93BzFq19AZ
491M6wwrHGg+1CDICMeIiYFp03aIMzMyHbvk2pRLM/Wn+kRFNtcabfl1dIfkaWsy
Jj9bLWoz5vyH3uS/RJcls028
-----END CERTIFICATE-----
EOF

sudo chmod 0777 /etc/ssl/certs/logstash-forwarder.crt

cd /etc/lf/logstash-forwarder/

sudo nohup ./logstash-forwarder -config /etc/lf/logstash-forwarder/lf.conf &