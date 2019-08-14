#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

apt_repository 'mongodb-org' do
 uri "http://repo.mongodb.org/apt/ubuntu"
 distribution 'trusty/mongodb-org/3.2'
 components ['multiverse']
 keyserver 'hkp://keyserver.ubuntu.com:80'
 key 'EA312927'
 action :add
end

directory '/data' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/data/db' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

package 'mongodb-org' do
  action :install
  options "--allow-unauthenticated"
end

# package 'mongodb-org' do
#   action :upgrade
#   options "--allow-unauthenticated"
# end

service 'mongod' do
  supports status: true, restart: true, reload: true, start: true, enabled: true
  action [:enable, :start]
  options "--allow-unauthenticated"
end



template '/etc/mongod.conf' do
  source 'mongod.conf.erb'
  mode '0600'
  owner 'root'
  group 'root'
  notifies :restart, 'service[mongod]'
end

template '/etc/systemd/system/mongod.service' do
  source 'mongod.service.erb'
  mode '0755'
  owner 'root'
  group 'root'
  notifies :restart, 'service[mongod]'
end
