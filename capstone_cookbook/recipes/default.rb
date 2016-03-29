#
# Cookbook Name:: capstone_cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"

application app_path do
  environment.update("PORT" => "80")

  git app_path do
    repository app["app_source"]["url"]
    revision app["app_source"]["revision"]
  end

  link "#{app_path}/app.js" do
    to "#{app_path}/index.js"
  end

  npm_install
  npm_start
end
