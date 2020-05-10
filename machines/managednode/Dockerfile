# This produces: Ubuntu + ssh server + Python 3

FROM rastasheep/ubuntu-sshd:18.04

# # Write a public rsa access key to the server's authorized_keys file,
# # sourcing the value by expecting a SSH_KEY command line argument
# # when <docker build> is run.

# ARG SSH_KEY
# ENV SSH_KEY=$SSH_KEY
# RUN mkdir /root/.ssh/
# RUN echo "$SSH_KEY" > /root/.ssh/authorized_keys
# RUN chmod 600 /root/.ssh/authorized_keys