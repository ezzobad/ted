#!/bin/bash
export instanceId=`curl  http://169.254.169.254/latest/meta-data/instance-id`
export AZ=`aws ec2 describe-instances --instance-ids "$instanceId" --query Reservations[].Instances[].Placement.AvailabilityZone --output text`
export PrivateIP=`aws ec2 describe-instances --instance-ids "$instanceId" --query Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddresses[]."PrivateIpAddress" --output text`
export PublicIP=` aws ec2 describe-instances --instance-ids "$instanceId" --query Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddresses[].Association.PublicIp --output text`

wget https://raw.githubusercontent.com/ezzobad/ted/master/ted.html -O /var/www/html/ted.html
sed -i "s/blah1/$instanceId/" /var/www/html/ted.html
sed -i "s/8.8.8.8/$PublicIP/" /var/www/html/ted.html
sed -i "s/1.1.1.1/$PrivateIP/" /var/www/html/ted.html
sed -i "s/us-east-1a/$AZ/" /var/www/html/ted.html
