# Test Task 

Environment preparation:
------------------------

1) git clone https://github.com/afont/test
2) cd test
3) Install vagrant, virtualbox and ansible if not installed yet.
4) Download Ubuntu 18.04: vagrant box add bento/ubuntu-18.04

( #All tasks has been developed and tested under Ubuntu 18.04 as requested. )

-- Task Consul: (directory: /test/consul)

1) vagrant up
2) vagrant provision
3) Open a browser to https://10.0.36.50:8500 


-- Task OpenSSL CA (directory: /test/CA)

1) First of all, adapt paths on {cwd}/test/CA/provision/group_vars/all to meet your {cwd}. 
2) vagrant up 
3) vagrant provision

VM will boot and launch ansible playbook that configures new CA from scratch and generates keys and certificates for Nginx webservers and for Strongswan IKEv2 VPN. It also copies files to its final destinations, so no intervention is necessary to bring up later both strongswan and ngnixssl+haproxy+keepalived.


-- Task Strongswan IKEv2 (directory: test/strongswan)

1) vagrant up
2) vagrant provision

Once machine is booted up, configure your preferred VPN client, with the following parameters:

remote server: 10.0.16.50
login: test_user
password: t3st-p4ssw0rd

CA certificate: copy from ~/test/strongswan/provision/roles/strongswan/templates/ca.pem to your computer and import it.


-- Task NGINX SSL wih HAPROXY and KEEPALIVED: (directory: test/webha) 

1) vagrant up
2) vagrant provision
2) Open browser to https://10.0.26.81 (HA service IP), check certificate that is signed with our recently created CA

Other IP's are:

load-balancer1 direct IP: https://10.0.26.201
load-balancer2 direct IP: https://10.0.26.202

* Note: In case that VRRP IP address from keepalived is not responding but haproxy IPs yes, just enter to haproxy1 and restart service:
	$ vagrant ssh haproxy1
	$ sudo su
	$ service keepalived restart



