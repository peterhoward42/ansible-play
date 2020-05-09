# This produces: Alpine Linux + ssh server + Python 3

# It configures the ssh server to accept connections only
# with one particular rsa key - specified on the
# <docker build> command line.

# The danielguerra/alpine-sshd base image does the following to Alpine:

# - installs the openssh package
# - installs a (neccesary) Docker ENTRYPOINT scrpt to:
#     - install a rsa host key
#     - make sure that /var/run/sshd exists (a dir)
#     - hand off control to the Dockerfile's CMD
# - specifies a (necessary) CMD that runs the ssh daemon.
# - EXPOSE(s) the ssh port (22) to the docker host

# Note that it does not register any authorized public authentication
# keys so we do that as the next step.

FROM danielguerra/alpine-sshd:3.7

# Write a public rsa access key to the server's authorized_keys file,
# sourcing the value by expecting a SSH_KEY command line argument
# when <docker build> is run.

ARG SSH_KEY
ENV SSH_KEY=$SSH_KEY
RUN mkdir /root/.ssh/
RUN echo "$SSH_KEY" > /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys