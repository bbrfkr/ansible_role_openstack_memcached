# ansible_role_openstack_memcached

This is an Ansible role. This role executes memcached settings for OpenStack environment.

## Processing
This role executes the following settings.

* memcached setting
  * install necessary packages
  * set memcached listen address
  * set memcached service enabled and started

## Caution!!
* This role assumpts a part of network settings (nics, default gateway and dns server) is completed.
* This role assumpts NetworkManager service is disabled and stopped.

## Support OpenStack release
* Ocata
* Pike

## Support OS

| OS | version |
|----|---------|
|CentOS|7|

## Role variables
```
openstack_memcached:
  listen_addr: 192.168.1.115  # listen address of memcached service
```

## Dependencies
- [bbrfkr.openstack_common](https://galaxy.ansible.com/bbrfkr/openstack_common/)

## Build status
|branch|status|
|------|------|
|master|[![Build Status](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_memcached_master/badge/icon)](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_memcached_master/)|
|ocata |[![Build Status](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_memcached_ocata/badge/icon)](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_memcached_ocata/)|
|pike |[![Build Status](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_memcached_pike/badge/icon)](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_memcached_pike/)|

## Retest
This role is tested by serverspec, then its test codes are included in repository. Users can retest this role by using the test codes. To retest this role, follow the steps described below.

1. Prepare 2 targets (Here, targets ip are X.X.X.X, Y.Y.Y.Y)
2. Install serverspec in local machine
3. Modify spec/inventory.yml
```
---
- conn_name: target15  # never change!
  conn_host: X.X.X.X   # target ip
  conn_port: 22        # target's ssh port
  conn_user: vagrant   # user to connect
  conn_pass: vagrant   # password of user
  conn_idkey:          # path of identity key 
                       # (absolute path or relative path from the location of Rakefile)
  sudo_pass:           # sudo password of user

- conn_name: target16  # never change!
  conn_host: Y.Y.Y.Y   # target ip
  conn_port: 22        # target's ssh port
  conn_user: vagrant   # user to connect
  conn_pass: vagrant   # password of user
  conn_idkey:          # path of identity key
                       # (absolute path or relative path from the location of Rakefile)
  sudo_pass:           # sudo password of user
```
4. Modify targets ips in any files of `spec` dir
```
$ sed -i 's/192\.168\.1\.115/X.X.X.X/g' `find spec -type f`
$ sed -i 's/192\.168\.1\.116/Y.Y.Y.Y/g' `find spec -type f`
```

5. Run `rake`

## License
MIT

## Author
Name: bbrfkr  
MAIL: bbrfkr@gmail.com

