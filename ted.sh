#!/bin/bash
# Populated the index.html file with proper instance information.
# By: Mehdi (awsengineer.com)
wget https://raw.githubusercontent.com/ezzobad/ted/master/ted.html -O /var/www/html/index.html
wget https://raw.githubusercontent.com/ezzobad/ted/master/homerwoohoo.jpg  -O /var/www/html/homerwoohoo.jpg

export instanceId=`curl  http://169.254.169.254/latest/meta-data/instance-id`
sed -i "s/blah/$instanceId/" /var/www/html/index.html

export AZ=`curl  http://169.254.169.254/latest/meta-data/placement/availability-zone/`
sed -i "s/us-east-1/$AZ/" /var/www/html/index.html

export PrivateIP=`curl  http://169.254.169.254/latest/meta-data/local-ipv4/`
sed -i "s/1.1.1.1/$PrivateIP/" /var/www/html/index.html

curl http://169.254.169.254/latest/meta-data/public-ipv4/   | grep 404
if [ $? -eq 0 ]
then
        sed -i "s/8.8.8.8/N\/A/" /var/www/html/index.html
else
        export PublicIP=`curl  http://169.254.169.254/latest/meta-data/public-ipv4/`
        sed -i "s/8.8.8.8/$PublicIP/" /var/www/html/index.html
fi
