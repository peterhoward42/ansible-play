# ansible-play

I want to do an Ansible tutorial.

I aim for this repo to contain a docker-compose that will create a small 
fleet of 'machines' to work with. One to run Ansible from, and two to act
as hosts that Ansible will configure (targets).

The tutorial stimulating this is:

https://serversforhackers.com/c/an-ansible2-tutorial

### Building the Ansible machine image (prerequisite)

```
cd .
docker build -t ansible .
```

### Bringing Up The Environment

```
docker-compose up -d --remove-orphans
docker ps
docker exec -it ansible-play_python1_1 /bin/bash
...
CTRL-d

docker exec -it ansible-play_ansible_1 /bin/bash
ansible some-args
...
CTRL-d

docker-compose down
```
