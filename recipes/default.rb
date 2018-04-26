#
# Cookbook Name:: ds_cronner
# Recipe:: default
#
# Copyright 2017 Tim Heckman <t@heckman.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cronner_version = node['cronner']['version']

cache_path = "#{Chef::Config[:file_cache_path]}/cronner-linux-amd64.tar.gz"
binary_path = "/opt/cronner-linux-amd64-v#{cronner_version}/cronner"

execute "extract_cronner_v#{cronner_version}" do
  command "tar -C /opt -xf #{cache_path}"
  action :nothing
end

remote_file cache_path do
  source "https://github.com/theckman/cronner/releases/download/v#{cronner_version}/cronner-linux-amd64-v#{cronner_version}.tar.gz"
  checksum node['cronner']['checksum']['linux-amd64'][cronner_version]
  notifies :run, "execute[extract_cronner_v#{cronner_version}]", :immediately
end

link '/usr/local/bin/cronner' do
  to binary_path
end
