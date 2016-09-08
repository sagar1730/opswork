# Default recipe file (Add into runlist)

# Author : Minjar Cloud Solutions

# Starting Date : 17/01/2016
#=================================================================================================================#

include_recipe 'apt::default'

package 'openvpn' 

package 'easy-rsa' 

execute 'server_file' do
	command node['openvpn']['server_file']  
end

include_recipe 'openvpn::server_conf'

execute 'packet-forwarding' do
  command node['openvpn']['packet-forwarding']
end

template '/etc/sysctl.conf' do                 ## Packet Forwarding for IPv4
  source 'sysctl.conf.erb'
  owner 'root'
  group 'root'
  mode '0777'                             
end

bash 'ufw' do                                  ## Setting up Uncomplicated Firewall
	user 'root'
	cwd '/home/ubuntu'
	code <<-EOH
    ufw allow ssh
    ufw allow 1194/udp
    EOH
end 

template '/etc/default/ufw' do                     
  source 'ufw.erb'
  owner 'root'
  group 'root'
  mode '0777'                             
end

template '/etc/ufw/before.rules' do             # Ufw rules for network address translation and IP masquerading of connected clients.
  source 'ufw_rules.erb'
  owner 'root'
  group 'root'
  mode '0777'                             
end

bash 'ufw_enable' do                            ## Enable the Uncomplicated Firewall
	user 'root'
	cwd '/home/ubuntu'
	code <<-EOH
    ufw enable
    EOH
end 

bash 'easy-rsa' do
	user 'root'
	cwd '/home/ubuntu'
	code <<-EOH
	cp -r /usr/share/easy-rsa/ /etc/openvpn
	mkdir /etc/openvpn/easy-rsa/keys
	openssl dhparam -out /etc/openvpn/dh2048.pem 2048
	EOH
end

template '/etc/openvpn/easy-rsa/vars' do         # Ufw rules for network address translation and IP masquerading of connected clients.
  source 'easy-rsa.erb'
  owner 'root'
  group 'root'
  mode '0777'                             
end

bash 'easy-rsa-PKI' do
	user 'root'
	cwd '/etc/openvpn/easy-rsa'
	code <<-EOH
	. ./vars
	./clean-all
	./build-ca --batch
	#{node['openvpn']['buildkey-server']}
	cp #{node['openvpn']['crt_copy']}
	#{node['openvpn']['buildkey-client']}
  cp #{node['openvpn']['ovpn_copy']}
	EOH
end 
 
 service 'openvpn' do
   supports :status => true, :restart => true, :reload => true, :start => true
   action [:start, :enable]
 end
 	
 #======================================================================================================================#