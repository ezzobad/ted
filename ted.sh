#!/bin/bash
export instanceId=`curl  http://169.254.169.254/latest/meta-data/instance-id`
export AZ=`curl  http://169.254.169.254/latest/meta-data/placement/availability-zone/`
export PrivateIP=`curl  http://169.254.169.254/latest/meta-data/local-ipv4/`
export PublicIP=`curl  http://169.254.169.254/latest/meta-data/public-ipv4/`

wget https://raw.githubusercontent.com/ezzobad/ted/master/ted.html -O /var/www/html/index.html
sed -i "s/blah1/$instanceId/" /var/www/html/index.html
sed -i "s/8.8.8.8/$PublicIP/" /var/www/html/index.html
sed -i "s/1.1.1.1/$PrivateIP/" /var/www/html/index.html
sed -i "s/us-east-1a/$AZ/" /var/www/html/index.html
