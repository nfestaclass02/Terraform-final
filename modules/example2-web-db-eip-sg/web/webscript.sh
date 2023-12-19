#!/bin/bash
sudo yum update -y
sudo yum install -y httpd.x86_64
sudo service httpd start
sudo systemctl enable httpd.service
sudo echo "Welcome to Nfesta Technologies $(hostname -f)" > /var/www/html/index.html
sudo mkdir /var/www/html/app2
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Nfesta Technologies</h1> <p>Terraform Testing Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app2/index.html