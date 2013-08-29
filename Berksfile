site :opscode

metadata
cookbook "apt"
cookbook "yum"
cookbook "java"
cookbook "apache2"
cookbook "mongodb", github: "edelight/chef-mongodb", ref: "1209ce8d6dbd713fe3e55cffc2f9e4086d948cd9"
cookbook "rbenv"
cookbook "build-essential"
cookbook "postfix"
cookbook "elasticsearch"
cookbook "passenger_apache2"

group :integration do
  cookbook 'minitest-handler'
end