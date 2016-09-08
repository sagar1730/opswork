# OpenVPN-cookbook
Application cookbook which installs and configures
OpenVPN server. 

For complete documentation on OpenVPN, check out
https://openvpn.net/index.php/open-source/documentation.html

## Supported OS

This cookbook is made for Ubuntu platform only and tested on Ubuntu 14.04, but it's expected to work on Ubuntu 12+ as well.

## Cookbook Dependency 

- apt

## Recipes

- `apt::default         `- Default recipe to manage apt packages.(add this into run_list)
- `openvpn::default     `- Default recipe (add this into run_list)
- `openvpn::server_conf `- Server Configuration, it will automatically get called from default recipe.

## Attributes

 Some of core attributes are
- `['openvpn']['server_file']          `- Gunzip the server.conf file to /etc/openvpn/server.conf
- `['openvpn']['packet-forwarding']    `- Echo to the /proc/sys/net/ipv4/ip_forward file

## Important (Server End)

You can change the default location, address settings by editing easy-rsa.erb file from template directory.

Currently this cookbook is not configuring/appending ip address in client.ovpn file as we are using public ip address which intended to change after every run. We have to do it manually as of right now. 

## Client Configuration

The client setup and config will change according to its platform. You have to copy all ca.crt, client1.key, client1.crt and client.ovpn file into the same path/to/openvpn/ directory. First install OpenVPN into it.

For Linux Client setup,
> sudo apt-get install openvpn

> sudo openvpn --config /etc/openvpn/client.ovpn    

For Android Devices,
> Install OpenVPN Connect from Google PlayStore

> Go to settings - Import - select the yourfile.ovpn file.

> Click on Connect...Bingo!!

For Windows Desktop, (I haven't tried yet but it should work)
> Install it from https://openvpn.net/index.php/open-source/downloads.html

> Place all the files at C:\Program Files\OpenVPN\config

> Just double-click on yourfile.ovpn or run the OpenVPN as an Admin and choose the profile.

One can also use Mac systems and iOS phones as an OpenVPN client, by following almost same method.