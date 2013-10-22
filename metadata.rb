name              "graylog2"
maintainer        "Phil Sturgeon"
maintainer_email  "email@philsturgeon.co.uk"
license           "Apache 2.0"
description       "Installs and configures Graylog2"
version           "0.1.3"
recipe            "graylog2", "Installs and configures Graylog2"

%w{ ubuntu centos }.each do |os|
  supports os
end

# OpsCode cookbook dependencies
depends "apt"     # http://community.opscode.com/cookbooks/apt
depends "yum"
depends "java"
depends "apache2" # http://community.opscode.com/cookbooks/apache2
depends "mongodb", "= 0.13.4" # https://github.com/edelight/chef-mongodb
depends "rbenv"
depends "build-essential"
depends "postfix"
depends "elasticsearch"
depends "passenger_apache2"
