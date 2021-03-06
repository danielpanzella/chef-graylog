#
# Cookbook Name:: graylog2
# Recipe:: apache2
#
# Copyright 2010, Medidata Solutions Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install Graylog2 web interface
include_recipe "graylog2::web_interface"

# Install Apache using the OpsCode community cookbook
include_recipe "apache2"

#TODO Look into using passenger_apache2 cookbook for this

# Install gem dependencies
rbenv_gem "passenger" do
	ruby_version "#{node[:graylog2][:ruby_version]}"
	version "#{node[:graylog2][:passenger_version]}"
end

# Install packages to build Apache module:

node[:graylog2][:apache2][:module_build_packages].each do |name|
  package name do
    action :install
  end
end

# Build the Apache module
bash "install-apache-module" do
  cwd "#{node[:graylog2][:basedir]}/web"
  code "source /etc/profile.d/rbenv.sh && yes | passenger-install-apache2-module"
  creates "/opt/rbenv/versions/#{node[:graylog2][:ruby_version]}/lib/ruby/gems/1.9.1/gems/passenger-#{node[:graylog2][:passenger_version]}/libout/apache2/mod_passenger.so"
  user "root"
  notifies :restart, "service[apache2]"
end

# Create an Apache vhost for the Graylog2 web interface
template "apache-vhost-conf" do
  path "#{node['apache']['dir']}/sites-available/graylog2"
  source "graylog2.apache2.erb"
  mode 0644
end

# Remove the default vhost
apache_site "000-default" do
  enable false
end

# Enable the Graylog2 web interface vhost
apache_site "graylog2"