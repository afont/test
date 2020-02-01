# Test task 

Environment preparation:
------------------------

1) tar -xvf test_task.tar
2) cd test_task
3) Install vagrant if necessary.
4) vagrant box add bento/ubuntu-18.04 #All tasks has been tested on Ubuntu 18.04 as requested. 

-Task Consul: (directory: /test/consul)

1) vagrant up
2) vagrant provision
3) Open a browser to https://10.0.36.50:8500 



- Task OpenSSL CA (directory: /test/CA)

1) Adapt paths on {cwd}/test/CA/provision/group_vars/all to meet your {cwd}. 
2) vagrant up 

VM will boot and launch ansible playbook that configures new CA from scratch and generates keys and certificates for Nginx webservers and for Strongswan IKEv2 VPN. It also copies files to its final destinations, so no intervention is necessary to bring up later both strongswan and ngnixssl+haproxy+keepalived.


- Task Strongswan IKEv2 (directory: test_task/strongswan)

1) vagrant up

Once machine is booted up, configure your preferred VPN client, with the following parameters:



-Task NGINX SSL wih HAPROXY and KEEPALIVED: (directory: test_task/webha) 

1) vagrant up
2) Open browser to https://10.0.26.81 (HA service IP), check certificate that is signed with our recently created CA

Other IP's are:

load-balancer1 direct IP: https://10.0.26.201
load-balancer2 direct IP: https://10.0.26.202

* Note: In case that VRRP IP address from keepalived is not responding but haproxy IPs yes, just enter to haproxy1 and restart service:
	$ vagrant ssh haproxy1
	$ sudo su
	$ service keepalived restart



