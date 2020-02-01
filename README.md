 
# Test Task 

To deploy this test task, I used Vagrant with Virtualbox VM's.
Just follow instructions below to provision different environments.

Please, let me know if something is not working and also, your feedback! :)

## Environment preparation:
```sh
$ git clone https://github.com/afont/test
$ cd test
$ #Install vagrant, virtualbox and ansible if not installed yet.
$ vagrant box add bento/ubuntu-18.04 #Download Ubuntu 18.04:
```
> All tasks has been developed and tested under Ubuntu 18.04 as requested.

## Task Consul: (directory: /test/consul)
```sh
$ vagrant up
$ vagrant provision
```
> Open a browser to https://10.0.36.50:8500 


## Task OpenSSL CA (directory: /test/CA)

First of all, adapt paths on {cwd}/test/CA/provision/group_vars/all to meet your {cwd}. 
```sh
$ vagrant up 
$ vagrant provision
```
> VM will boot and launch ansible playbook that configures new CA from scratch and generates keys and certificates for Nginx webservers and for Strongswan IKEv2 VPN. It also copies files to its final destinations, so no intervention is necessary to bring up later both strongswan and ngnixssl+haproxy+keepalived.


## Task Strongswan IKEv2 (directory: test/strongswan)
``` sh
vagrant up
vagrant provision
```
> Once machine is booted up, configure your preferred VPN client, with the following parameters:
```
remote server: 10.0.16.50
login: test_user
password: t3st-p4ssw0rd
CA certificate: copy from ~/test/strongswan/provision/roles/strongswan/templates/ca.pem to your computer and import it.
```

## Task NGINX SSL wih HAPROXY and KEEPALIVED: (directory: test/webha) 

```sh
vagrant up
vagrant provision
```
> Open browser to https://10.0.26.81 (HA service IP), check certificate that is signed with our recently created CA

Other IP's are:

load-balancer1 direct IP: https://10.0.26.201
load-balancer2 direct IP: https://10.0.26.202

* Note: In case that VRRP IP address from keepalived is not responding but haproxy IPs yes, just enter to haproxy1 and restart service:
```sh
$ vagrant ssh haproxy1
$ sudo su
$ service keepalived restart
```



