# Docker Script  

This code constains a script for install docker in ubuntu  

## Run:  
```
sudo chmod +x docker.bash
./docker.bash
sudo docker run -d --name Jupyter --mount type=bind,source="/mnt/c/Users/...",target=/work -p 8888:8888 richi1325/spylon:1.0.0
```