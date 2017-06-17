puts ("==============================")
puts ("Role test")
puts ("openstack_mariadb: #{ ENV['CONN_NAME'] }")
puts ("==============================")

system("cd spec && rm -rf host_vars")
system("cd spec && cp -r host_vars_dirs/host_vars_01 host_vars")
system("cd spec && ansible-playbook -i inventory site.yml")

require 'spec_helper'
file_dir = File.dirname(__FILE__)

describe ("check necessary packages are installed") do
  packages = ["memcached", "python-memcached"]
  packages.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end

describe ("check memcached listen address is set") do
  describe file("/etc/sysconfig/memcached") do
    its(:content) { should match /^OPTIONS="-l 127.0.0.1,::1,192.168.1.115"$/ }
  end
end

describe ("check memcached service is enabled and started") do
  describe service("memcached") do
    it { should be_running }
    it { should be_enabled }
  end
end
