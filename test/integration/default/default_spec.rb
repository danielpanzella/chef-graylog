require 'minitest/spec'

describe_recipe 'graylog2::apache2' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

  it "should install and start elasticsearch as a service" do
    service("elasticsearch").must_be_running
  end

  it "should install and start mongodb as a service" do
    service("mongod").must_be_running
  end
  
  it "should install and start graylog2 as a service" do
    service("graylog2").must_be_running
  end

  it "should install and start apache2 as a service" do
    service("apache2").must_be_running
  end

end