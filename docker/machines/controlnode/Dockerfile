# This produces: Ubuntu + Python 3 + Ansible installed.

FROM ubuntu:18.04

# Helps for development to have vi.
RUN apt update; apt install --assume-yes vim

# Install Ansible
RUN apt install software-properties-common --assume-yes
RUN apt-add-repository --yes ppa:ansible/ansible
RUN apt update
RUN apt install ansible --assume-yes

# Create a sudo user called ansibleu, with password ansiblepasswd
RUN useradd -m -g sudo ansibleu
RUN echo ansibleu:ansiblepasswd | chpasswd

# Install ssh keys for the ansible user.

RUN mkdir /home/ansibleu/.ssh

ARG SSH_KEY_PUBLIC
ENV SSH_KEY_PUBLIC=$SSH_KEY_PUBLIC
RUN echo "$SSH_KEY_PUBLIC" > /home/ansibleu/.ssh/id_rsa.pub

ARG SSH_KEY_PRIVATE
ENV SSH_KEY_PRIVATE=$SSH_KEY_PRIVATE
RUN echo "$SSH_KEY_PRIVATE" > /home/ansibleu/.ssh/id_rsa

# Give it something long-running to do, to prevent the container exiting.
CMD ["tail", "-f", "/dev/null"]
