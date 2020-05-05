FROM python:3-buster

WORKDIR /usr/src/app

RUN pip install ansible

CMD [ "/bin/sh" ]
