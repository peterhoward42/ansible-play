# ansible-play

I want to do an Ansible tutorial.

I aim for this repo to faciliate it by docker-composing a
small fleet of 'machines' to work with: one ansible control
node, and two managed nodes.

### Bringing Up The Environment

Nb. this **assumes** you aready have a pair of (rsa) SSH keys in your ~/.ssh/ directory.

```
cd .
make managed-node-run
```

### What You Get

The ansible control node is Ubuntu + SSH client + Ansible.

The managed nodes are Ubuntu + SSH server + Python3

The nodes are pre-configured, such that the control node is able to SSH
into the managed node as their root user.

This repo contains some tutorial resources - and these are mounted
into the ansible control node.

The easiest way to get shell access into the ansible control need is with

```
docker exec -it controlnode /bin/sh
```

### Cleaning Up

tbd - not using compose yet


### Credits

https://serversforhackers.com/c/an-ansible2-tutorial

https://hub.docker.com/r/rastasheep/ubuntu-sshd/


### 



docker exec -it ansible-play_control-node_1 /bin/bash 
ping ansible-play_managed-node_1                    
ping ansible-play_managed-node_2                   
ansible some-args                              
...
CTRL-d

docker-compose down
```
