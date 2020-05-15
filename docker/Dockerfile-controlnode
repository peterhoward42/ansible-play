# This produces: Ubuntu + Python 3 + Ansible installed.

FROM ubuntu:18.04

RUN apt update; apt install --assume-yes vim; apt install --assume-yes python3

# Install Ansible
RUN apt install software-properties-common --assume-yes
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt install ansible --assume-yes

# Create a sudo user called ansibleu.
# With password ansiblepasswd,
# And a default shell of bash rather than dash.
RUN useradd -m -g sudo ansibleu
RUN echo ansibleu:ansiblepasswd | chpasswd
RUN chsh -s /bin/bash ansibleu

# Install ssh key pair for the ansible user and
# change the ownership of that whole .ssh directory to ansibleu.
RUN mkdir /home/ansibleu/.ssh
COPY ssh/* /home/ansibleu/.ssh/
RUN touch /home/ansibleu/.ssh/known_hosts
RUN chown -R ansibleu /home/ansibleu/.ssh

# Install an Ansible hosts file populated with the anticipated managed nodes.
COPY ansible/hosts /etc/ansible/hosts

# Give the container something long-running to do, to prevent the container exiting.
CMD ["tail", "-f", "/dev/null"]
