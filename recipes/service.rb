#
# Cookbook Name:: nginx
# Recipe:: service
#
# Copyright (C) 2013 Daniel Nolte 

include_recipe "nginx::default"

nginx_unicorn node['app']['id']
