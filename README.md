# ansible-play

I want to do an Ansible tutorial.

I aim for this repo to contain a docker-compose that will create a small 
fleet of 'machines' to work with. One ansible control node, and two managed
nodes.

The repo has a *tutorial* directory, and this is mounted onto
the control node at /tutorial.

The ansible tutorial stimulating this is here...

https://serversforhackers.com/c/an-ansible2-tutorial

### Building the Ansible machine image (prerequisite)

```
cd .
docker build -t ansible .
```

### Bringing Up The Environment

```
docker-compose up -d --remove-orphans --scale managed-node=2 
docker ps                                      
docker exec -it ansible-play_control-node_1 /bin/bash 
ping ansible-play_managed-node_1                    
ping ansible-play_managed-node_2                   
ansible some-args                              
...
CTRL-d

docker-compose down
```
