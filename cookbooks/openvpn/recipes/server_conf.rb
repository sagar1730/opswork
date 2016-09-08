#####################################################################################################

template '/etc/openvpn/server.conf' do           ## Basic server Configuration
  source 'server.conf.erb'
  owner 'root'
  group 'root'
  mode '0777'                             
end

#####################################################################################################
