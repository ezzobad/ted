#!/bin/bash
yum update -y
yum install httpd python34 python34-pip -y
#/usr/bin/pip-3.4 install --upgrade pip
sleep 5
sync; sync; sync
/usr/bin/pip-3.4 install sphinx
sync
/usr/bin/pip-3.4 install htmltag
chkconfig httpd on
wget https://raw.githubusercontent.com/ezzobad/ted/master/ted.py -O /var/www/cgi-bin/ted.py
chmod +x /var/www/cgi-bin/ted.py
service httpd start
