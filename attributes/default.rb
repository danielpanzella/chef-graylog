default[:graylog2][:basedir] = "/var/graylog2"
default[:graylog2][:server][:version] = "0.11.0"
default[:graylog2][:web_interface][:version] = "0.11.0"
default[:graylog2][:web_interface][:listen_port] = 4500 # if this is not 80 you need to override default['apache']['listen_ports'] = [ "80" ] 
default[:graylog2][:web_interface][:secret_key] = "CHANGE ME"
default[:graylog2][:web_interface][:file_owner] = "nobody"
case node['platform_family']
when "rhel"
    default[:graylog2][:web_interface][:file_group] = "nobody"
when "debian"
    default[:graylog2][:web_interface][:file_group] = "nogroup"
end

case node['platform_family']
when "rhel"
    default[:graylog2][:apache2][:module_build_packages] = ["libcurl-devel","httpd-devel","apr-devel","apr-util-devel"]
when "debian"
    default[:graylog2][:apache2][:module_build_packages] = ["libcurl4-openssl-dev","apache2-threaded-dev","libapr1-dev","libaprutil1-dev"]
end

default.elasticsearch[:version]       = "0.20.4"
default.elasticsearch[:host]          = "http://download.elasticsearch.org"
default.elasticsearch[:repository]    = "elasticsearch/elasticsearch"
default.elasticsearch[:filename]      = "elasticsearch-#{node.elasticsearch[:version]}.tar.gz"
default.elasticsearch[:download_url]  = [node.elasticsearch[:host], node.elasticsearch[:repository], node.elasticsearch[:filename]].join('/')

default[:elasticsearch][:cluster][:name] = "graylog2"

default[:graylog2][:mongodb][:host] = "localhost"
default[:graylog2][:mongodb][:port] = 27017
default[:graylog2][:mongodb][:max_connections] = 150
default[:graylog2][:mongodb][:database] = "graylog2"
default[:graylog2][:mongodb][:auth] = "false"
default[:graylog2][:mongodb][:user] = "user"
default[:graylog2][:mongodb][:password] = "password"

default[:graylog2][:protocol] = "udp"
default[:graylog2][:port] = 514
default[:graylog2][:gelf_port] = 12201
default[:graylog2][:collection_size] = 50000000
default[:graylog2][:email] = "graylog2@example.org"
default[:graylog2][:configure_email] = true
default[:graylog2][:allow_deleting] = "false"
default[:graylog2][:send_stream_alarms] = true
default[:graylog2][:send_stream_subscriptions] = true
default[:graylog2][:stream_alarms_cron_minute] = "*/15"
default[:graylog2][:stream_subscriptions_cron_minute] = "*/15"

default[:graylog2][:external_hostname] = nil
default[:graylog2][:server_name] = "graylog2"

default[:graylog2][:ruby_version] = "1.9.3-p327"
default[:graylog2][:passenger_version] = "4.0.5"

default[:graylog2][:unicorn][:worker_processes] = 1
default[:graylog2][:unicorn][:timeout] = 30
default[:graylog2][:unicorn][:preload_app] = true