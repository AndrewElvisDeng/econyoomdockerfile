# FROM python:alpine3.7 
# FROM ubuntu:latest
FROM nikolaik/python-nodejs

# We copy just the requirements.txt first to leverage Docker cache
# COPY . /app
#instead, git clone the repo
# RUN mkdir app
RUN git clone https://gitlab.com/kcolburn38/idb-3-website.git
RUN ls
WORKDIR /idb-3-website

RUN ls
RUN cd frontend && yarn install && yarn build
RUN pwd && ls
RUN pip3 install -r requirements.txt

EXPOSE 5000

COPY . /app


ENTRYPOINT [ "python" ]

CMD [ "git pull", "api.py" ]
# CMD [ "git pull --force", "api.py" ]
# CMD [ "git pull --force", "python3 api.py" ]
# CMD [ "git pull --force &&", "api.py" ]
