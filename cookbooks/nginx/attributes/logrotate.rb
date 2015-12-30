
default[:nginx][:logrotate][:rotate]     = "6"
default[:nginx][:logrotate][:maxsize]    = "100M"
default[:nginx][:logrotate][:dateformat] = "-%Y-%m-%d-%s"
default[:nginx][:logrotate][:frequency]  = "daily"
default[:nginx][:logrotate][:prerotate]  = ""
default[:nginx][:logrotate][:postrotate] = ""
default[:nginx][:logrotate][:cron_minute]= 5
