#
# Cookbook Name:: capstone_cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
Chef::Log.info("********** Hello, World! **********")
app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"
Chef::Log.info("********** Application Path **********"+app_path)