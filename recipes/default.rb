#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (C) 2013 Daniel Nolte 

# TODO bootstrap machine with it
gem_package "chef" do
  action :install
  version "11.4.0"
end

apt_repository "nginx" do
  uri          "http://nginx.org/packages/mainline/ubuntu/"
  distribution node['lsb']['codename']
  components   ["nginx"]
  key          "nginx.key"
end

package "nginx" do
  action "install"
end


%w[default.conf example_ssl.conf].each do |name|
  file "/etc/nginx/conf.d/#{name}" do
    action :delete
  end
end
