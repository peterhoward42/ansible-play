# Produces a linux container with python installed, the
# ssh daemon running, and one (ssh) user provisioned.

# You specify the username and password you want in
# environment variables at docker-build time.

FROM python:3-buster

RUN apt-get update && \
apt-get install -y netcat ssh iputils-ping && \
mkdir /var/run/sshd && \
chmod 0755 /var/run/sshd && \
useradd -p $(openssl passwd -1 userfibblepass) --create-home --shell /bin/bash --groups sudo userfibble

EXPOSE 22

CMD [ "tail", "-f", "/dev/null"]
#CMD ["/usr/sbin/sshd", “-D”]