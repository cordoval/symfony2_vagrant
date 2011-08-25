#
# Cookbook Name:: symfony2
# Recipe:: default
#

# Update our sources
e = execute "apt-get update" do
  action :nothing
end

e.run_action(:run)

include_recipe "dotdeb::php53"


package "nginx"

package "php5-fpm" 
package "php5-cli" 
package "php5-mysql"
package "php5-intl"
package "php5-sqlite"
package "php5-apc"

# For snakeoil certs
package "ssl-cert"

package "git"

# needed to set ACLs on the app/cache and app/log directories
package "acl"

# Create the apps directory
directory "/var/www/apps" do
  owner "vagrant"
  group "www-data"
  mode "0755"
  action :create
  recursive true
end

# Now remove the nginx default site
file "/etc/nginx/sites-enabled/default" do
  action :delete
end

# now create our Symfony2 site
cookbook_file "/etc/nginx/sites-available/symfony2" do
  source "symfony2"
  mode "0644"
end

# and link it
# ln -s /etc/nginx/sites-available/symfony2 /etc/nginx/sites-enabled/symfony2
link "/etc/nginx/sites-enabled/symfony2" do
  to "/etc/nginx/sites-available/symfony2"
  notifies :reload, "service[nginx]"
end

# Set up a default phpinfo.php file to test
cookbook_file "/var/www/apps/phpinfo.php" do
  source "phpinfo.php"
  mode "0644"
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

service "php5-fpm" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
