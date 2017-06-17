puts ("==============================")
puts ("Role test")
puts ("openstack_mariadb: #{ ENV['CONN_NAME'] }")
puts ("==============================")

system("cd spec && rm -rf host_vars")
system("cd spec && cp -r host_vars_dirs/host_vars_01 host_vars")
system("cd spec && ansible-playbook -i inventory site.yml")

require 'spec_helper'
file_dir = File.dirname(__FILE__)

describe ("check memcached listen address is set") do
  describe file("/etc/sysconfig/memcached") do
    its(:content) { should match /^OPTIONS="-l 127.0.0.1,::1,192.168.1.116"$/ }
  end
end
