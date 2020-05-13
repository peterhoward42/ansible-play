# ansible-play

I want to do an Ansible tutorial.

I aim for this repo to faciliate that, by docker-composing an
infrastructure with a small fleet of 'machines' to work with:
one ansible control node, and three managed nodes.

### Bringing Up (and Down) The Environment

Nb. this **assumes** you aready have a pair of (rsa) SSH keys in your ~/.ssh/ directory.

```
cd .
make infrastructure up
...
make infrastructure down
```

### What You Get

The ansible control node is Ubuntu + SSH client + Ansible.

The managed nodes are Ubuntu + SSH server + Python3

The nodes are pre-configured, such that the control node is able to SSH
into the managed node as their root user.

This repo contains some tutorial resources - and these are mounted
into the ansible control node.

### Credits

https://serversforhackers.com/c/an-ansible2-tutorial

https://hub.docker.com/r/rastasheep/ubuntu-sshd/


