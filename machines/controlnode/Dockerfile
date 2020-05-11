# This produces: Ubuntu + Python 3 + Ansible installed.

FROM ubuntu:18.04

# Helps for development to have vi.
RUN apt update; apt install --assume-yes vim

# Install Ansible
RUN apt install software-properties-common --assume-yes
RUN apt-add-repository --yes ppa:ansible/ansible
RUN apt update
RUN apt install ansible --assume-yes

CMD ["tail", "-f", "/dev/null"]
