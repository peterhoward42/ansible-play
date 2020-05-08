# Alpine Linux + ssh + Python 3

# The danielguerra/alpine-sshd base image does the following to Alpine:

# - installs the openssh package
# - installs a (neccesary) Docker ENTRYPOINT scrpt to:
#     - install a rsa key
#     - make sure that /var/run/sshd exists (a dir)
#     - hand off control to the Dockerfile's CMD
# - specifies a (necessary) CMD to run the ssh daemon.

# Note that it does not:
# - create users or passwords
# - register any user's authorized keys with ssh

# These things *are* necessary however, and must be accomplished separately.

FROM danielguerra/alpine-sshd:3.7