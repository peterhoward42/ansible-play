FROM python:3-buster

WORKDIR /

RUN pip install ansible

CMD [ "/bin/sh" ]
