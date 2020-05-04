# ansible-play

I want to do an Ansible tutorial.

I aim for this repo to contain my experiments, along with a docker-compose
system to bring some machines for it to configure, and another to run
Ansible on.

### Bringing Up The First Machine

```
docker-compose up -d --remove-orphans
docker ps
docker exec -it ansible-play_python1_1 /bin/bash
...
CTRL-d
docker-compose down
```
