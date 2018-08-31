#
# Cookbook Name:: centos7post
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# RHEL 7 Post Script
# Base Packages Installation 

package 'autoconf' do
  action :install
end

package 'bison' do
  action :install
end

package 'flex' do
  action :install
end

package 'gettext' do
  action :install
end

package 'mailx' do
  action :install
end

package 'bind-utils' do
  action :install
end

package 'unzip' do
  action :install
end

package 'mlocate' do
  action :install
end

package 'telnet' do
  action :install
end

package 'tcpdump' do
  action :install
end

package 'traceroute' do
  action :install
end

package 'wget' do
  action :install
end

package 'lynx' do
  action :install
end

package 'tree' do
  action :install
end

package 'zip' do
  action :install
end

package 'man' do
  action :install
end

package 'dos2unix' do
  action :install
end

package 'cyrus-sasl-plain' do
  action :install
end

package 'sysstat' do
  action :install
end

package 'gcc' do
  action :install
end

package 'net-tools' do
  action :install
end

# Disable Firewall

execute 'Disable Firewalld' do
  command '/bin/systemctl disable firewalld'
  ignore_failure true
end

# System Update

execute 'System Update' do
  command 'yum update'
  ignore_failure true
end

# Disable Network manager

execute 'Disable Firewalld' do
  command '/bin/systemctl disable NetworkManager'
  ignore_failure true
end

# Install Snoopy

cookbook_file "/etc/yum.repos.d/snoopy.repo" do
  owner 'root'
  group 'root'
  source "snoopy.repo"
  mode "0644"
end

execute "install snoopy" do
  command "yum --enablerepo=linuxhq_snoopy install -y snoopy"
end
