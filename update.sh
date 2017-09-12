#!/bin/bash

sudo service docker-flask-app-1.0 stop
sudo docker rmi $(sudo docker images | grep 'nickage87/flask-app' | awk {'print $3'})
sudo /opt/puppetlabs/bin/puppet apply /root/flask-docker/flask.pp
