FROM ubuntu:16.04

MAINTAINER Nikolay Sizov nickage@mail.ru

RUN apt-get update -y
RUN apt-get install -y python=2.7.* python-pip python-dev build-essential git nginx
RUN pip install flask==0.12 gunicorn
RUN mkdir /home/app
WORKDIR /home/app
RUN git clone https://github.com/nickage87/flask-app.git 
WORKDIR /home/app/flask-app
RUN mv nginx-config/default /etc/nginx/sites-available/default
RUN service nginx start 
EXPOSE 80
CMD service nginx start && gunicorn --bind 0.0.0.0:8080 flaskapp:app
