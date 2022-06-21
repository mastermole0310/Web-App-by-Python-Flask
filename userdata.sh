#!/bin/bash
apt update
apt upgrade -y
apt install docker.io -y 
systemctl start docker 
groupadd docker
usermod -aG docker ubuntu
apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools -y
apt install python3-venv -y
python3 -m venv venv
source venv/bin/activate
pip install Flask
docker build -t web_app /home/ubuntu/
docker run -d -p 8081:5000 --name flask_json web_app
