# ansible-play

I want to do an Ansible tutorial.

I aim for this repo to faciliate that, by docker-composing an
infrastructure with a small fleet of 'machines' to work with -
comprising one ansible control node, and three managed nodes.

### Bringing Up (and Down) The Environment

```
cd .
make infrastructure-up
...
make infrastructure-down
```

### Smoke Test for Ansible Viability
Assumes infrastructure is up.

```
docker exec -it docker_controlnode_1 /bin/sh
su ansibleu
ansible all -m ping -u root
```

### What's In The Infrastructure?

The ansible control node is Ubuntu + SSH client + Ansible.

The managed nodes are Ubuntu + SSH server + Python3

The control node has a (sudo) user called *ansibleu* to run ansible
commands (like the smoke test above), or to ssh directly
into root@docker_managednode_2 (or 1, or 3).

This repo has some tutorial resources - and these are mounted as
a volume into the ansible control node at `/tutorial`.

### Running the tutorial playbook

This is the playbook I'm evolving - based on a rules-based
setup.

At the moment all it does is install the <ag> package.
```
docker exec -it docker_controlnode_1 /bin/sh
su ansibleu
cd tutorial
ansible-playbook -u root run-muck-about-role.yaml
```


### Credits
https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-18-04

https://serversforhackers.com/c/an-ansible2-tutorial

https://hub.docker.com/r/rastasheep/ubuntu-sshd/



