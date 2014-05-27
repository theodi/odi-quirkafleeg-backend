#
# Cookbook Name:: odi-quirkafleeg-backend
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#From quirkafleeg
include_recipe "odi-apt"
include_recipe "build-essential"
include_recipe "git"
include_recipe "postfix"
include_recipe "ntp"
include_recipe "odi-users"
include_recipe "odi-rvm"
include_recipe "odi-pk"
include_recipe "mysql::client"
include_recipe "dictionary"
include_recipe "nodejs::install_from_package"
#Following fails because of statsd, credentials databag
#include_recipe "odi-statsd"
include_recipe "fail2ban"

#from quirkafleeg-backend
include_recipe "imagemagick"

include_recipe "odi-nginx"
include_recipe "envbuilder"
include_recipe 'quirkafleeg-deployment'