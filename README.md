Symfony2 Web Server
===================


This will set up a complete [Symfony2](http://www.symfony.com) web server (no database server) in a VM using [Vagrant](http://www.vagrantup.com).
[Chef-Solo](http://wiki.opscode.com/display/chef/Chef+Solo) is used to provision the server.

The [DotDeb](http://www.dotdeb.org) repositories are used to install the latest version of PHP and latest stable version of [nginx](http://nginx.net).

This has been tested on *Ubuntu 11.04* only, but it should work on Debian 5 too.

You will need to have a Vagrant box already created with the name "natty-64", or else edit the Vagrantfile to point to your own Vagrant box.

This _does not_ download or setup Symfony2 on the VM.

*Note:*
To use ACLs on the Symfony2 app/cache and app/logs folders (see [instructions](http://symfony.com/doc/current/book/installation.html)), you need to add the _acl_ option to your partition in */etc/fstab*