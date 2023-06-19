#!/bin/bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo service docker start
container_id=$(sudo docker run -d --name Jupyter --mount type=bind,source="/mnt/c/Users/...",target=/work -p 8888:8888 richi1325/spylon:1.0.0)
if [ -n "$container_id" ]; then
  echo "sudo service docker start" >> $HOME/.bashrc
  echo "sudo docker start Jupyter" >> $HOME/.bashrc
else
  echo "No se pudo crear el contenedor"
fi