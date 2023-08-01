# #!/bin/bash
# # Update the package list
# sudo apt-get update
# # Install nginx
# sudo apt-get install -y nginx
# # Start and enable nginx service
# sudo systemctl start nginx
# sudo systemctl enable nginx
# # Create user test with password 12345
# sudo adduser test --disabled-password --gecos ""
# echo "test:12345" | sudo chpasswd
# sed -i 's/Welcome/Chao/g' /usr/share/nginx/html/index.html
# sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# service sshd restart
sudo echo "hello world" > test.txt