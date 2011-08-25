#
# Cookbook Name:: symfony2
# Recipe:: debug
#

include_recipe "symfony2"


package "php5-xdebug"

template "/etc/php5/fpm/conf.d/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources("service[php5-fpm]"), :delayed
end

template "/etc/php5/conf.d/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources("service[php5-fpm]"), :delayed
end