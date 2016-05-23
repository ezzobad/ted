#!/bin/bash
export instanceId=`curl  http://169.254.169.254/latest/meta-data/instance-id`
export AZ=`curl  http://169.254.169.254/latest/meta-data/placement/availability-zone/`
export PrivateIP=`curl  http://169.254.169.254/latest/meta-data/local-ipv4/`
export PublicIP=`curl  http://169.254.169.254/latest/meta-data/public-ipv4/`

wget https://raw.githubusercontent.com/ezzobad/ted/master/ted.html -O /var/www/html/index.html
wget https://raw.githubusercontent.com/ezzobad/ted/master/homerwoohoo.jpg  -O /var/www/html/homerwoohoo.jpg
sed -i "s/blah/$instanceId/" /var/www/html/index.html
if [ "$PublicIP" =  "" ]
then
        sed -i "s/8.8.8.8/N\/A/" /var/www/html/index.html
else
        sed -i "s/8.8.8.8/$PublicIP/" /var/www/html/index.html
fi
sed -i "s/1.1.1.1/$PrivateIP/" /var/www/html/index.html
sed -i "s/us-east-1/$AZ/" /var/www/html/index.html
