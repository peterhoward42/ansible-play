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
docker-compose up -d --remove-orphans
docker ps                                      # Are the services up?
docker exec -it ansible-control /bin/bash      # Login to a shell on the control machine
ping ansible-managed-a                         # Are the virtual IP addresses viable?
ping ansible-managed-b
ansible some-args                              # Can I run ansible here?
...
CTRL-d

docker-compose down
```
