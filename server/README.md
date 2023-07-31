# Server setup

1. Docker: https://docs.docker.com/engine/install/ubuntu/

chmod +x install_docker.sh
./install_docker.sh

2. CapRover: https://caprover.com/docs/get-started.html#step-1-caprover-installation

docker run -p 80:80 -p 443:443 -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock -v /captain:/captain caprover/caprover

3. Login 1.1.1.1:3000 password: captain42

4. See the logs: cat /var/log/cloud-init-output.log