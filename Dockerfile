# FROM python:alpine3.7 
# FROM ubuntu:latest
FROM nikolaik/python-nodejs

# We copy just the requirements.txt first to leverage Docker cache
COPY . /app
#instead, git clone the repo
RUN  ls

WORKDIR /app

RUN ls
RUN cd frontend && yarn install && yarn build
RUN pwd && ls
RUN pip3 install -r requirements.txt
# RUN	pip3 install flask
# RUN	pip3 install flask-restful
# RUN	pip3 install SQLAlchemy
# RUN	pip3 install requests
# RUN pip3 install psycopg2

EXPOSE 5000

COPY . /app


ENTRYPOINT [ "python" ]

CMD [ "api.py" ]
# CMD [ "git pull --force", "api.py" ]
# CMD [ "git pull --force", "python3 api.py" ]
# CMD [ "git pull --force &&", "api.py" ]
