# Attribute default file 
# Author : Minjar Cloud Solutions

########################################################################################################################

default['openvpn']['server_file']        = 'gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz > /etc/openvpn/server.conf'
default['openvpn']['packet-forwarding']  = 'echo 1 > /proc/sys/net/ipv4/ip_forward'
default['openvpn']['crt_copy']           = '/etc/openvpn/easy-rsa/keys/{server.crt,server.key,ca.crt} /etc/openvpn'
default['openvpn']['ovpn_copy']          = '/usr/share/doc/openvpn/examples/sample-config-files/client.conf /etc/openvpn/easy-rsa/keys/client.ovpn'
#default['openvpn']['buildkey-server']    = './build-key-server --batch server'
#default['openvpn']['buildkey-client']    = './build-key --batch client1'

#########################################################################################################################