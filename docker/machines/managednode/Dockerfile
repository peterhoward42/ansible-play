# This produces: Ubuntu + (running) ssh server + Python 3

# rastasheep's base image provides Ubuntu (with Python 3.6) and adds the running ssh server.
# But allows password authentication for root access, so we
# configure rsa key based authentication, and disable password authentication.
FROM rastasheep/ubuntu-sshd:18.04

# Helps for development to have vi.
RUN apt update; apt install --assume-yes vim

# Write a public rsa access key to the server's authorized_keys file,
# sourcing the value by expecting a SSH_KEY command line argument
# when <docker build> is run.
ARG SSH_KEY_PUBLIC
ENV SSH_KEYPUBLIC=$SSH_KEY_PUBLIC
RUN echo "$SSH_KEY_PUBLIC" > /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Disable password-authenticated ssh access
RUN sed --re -i 's/^\#?PasswordAuthentication.*$/PasswordAuthentication no/' /etc/ssh/sshd_config
