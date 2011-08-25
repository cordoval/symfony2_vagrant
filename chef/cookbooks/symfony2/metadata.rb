maintainer        "Shane O'Grady"
maintainer_email  "shane.ogrady@gmail.com"
license           "Apache 2.0"
description       "Configures Symfony2 server with nginx, PHP-FPM and APC"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1"

recipe            "symfony2", "Installs base Symfony2 server"
recipe            "symfony2::debug", "Installs base Symfony2 server with Xdebug"


%w{ ubuntu debian }.each do |os|
  supports os
end
