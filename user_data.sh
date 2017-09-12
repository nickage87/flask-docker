#!/bin/bash

apt instal curl -y
curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get update
apt-get install -y puppet-agent git
#Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-get install -y software-properties-common python-software-properties
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce

/opt/puppetlabs/bin/puppet module install garethr-docker --version 5.3.0
/opt/puppetlabs/bin/puppet module install puppetlabs-vcsrepo --version 1.0.2
git clone https://github.com/nickage87/flask-docker.git
/opt/puppetlabs/bin/puppet apply flask-docker/flask.pp
#/usr/bin/docker run --name=flask-app-1.0 -p 80:80 -d nickage87/flask-app:1.0

curl -X POST --data-urlencode 'payload={"channel": "#random", "username": "aws-bot", "text": " The flask instance has been started!", "icon_emoji": ":ghost:"}' https://hooks.slack.com/services/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

