#!/bin/bash
yum update -y
yum install httpd python34 python-pip -y
pip install --upgrade pip
sleep 5
sync; sync; sync
/usr/local/bin/pip install sphinx htmltag
chkconfig httpd on
wget https://raw.githubusercontent.com/ezzobad/ted/master/ted.py -O /var/www/cgi-bin/ted.py
chmod +x /var/www/cgi-bin/ted.py
service httpd start
