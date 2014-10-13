#
# Cookbook Name:: pagekit
# Recipe:: server
#
# Copyright (C) 2014 Leonard TAVAE
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# install the database software
include_recipe 'mysql::server'

# create the database
include_recipe 'database::mysql'

mysql_connection_info = {
  host: 'localhost',
  username: 'root',
  password: node['mysql']['server_root_password']
}

mysql_database 'pagekit' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'pagekit' do
  connection mysql_connection_info
  password 'pagekit'
  action :create
end

mysql_database_user 'pagekit' do
  connection mysql_connection_info
  password 'pagekit'
  database_name 'pagekit'
  host 'localhost'
  action :grant
end

# install the web server
package 'php5-mysql' do
  action :install
end

package 'php5-curl' do
  action :install
end

include_recipe 'apache2::default'
include_recipe 'apache2::mod_php5'

# install composer
include_recipe 'composer::default'

# install pagekit
directory '/var/www/pagekit' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

git '/var/www/pagekit' do
  repository 'https://github.com/pagekit/pagekit.git'
  revision 'master'
  action :sync
  user 'www-data'
  group 'www-data'
  notifies :run, 'bash[composer_update]', :immediately
end

bash 'composer_update' do
  user 'root'
  cwd '/var/www/pagekit'
  code <<-EOH
  composer update
  EOH
end
