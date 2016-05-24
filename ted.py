#!/usr/bin/python

from htmltag import img, center
from time import gmtime, strftime
import subprocess

print("Content-Type: text/html;charset=utf-8")
print("")

InstanceID = subprocess.getoutput("curl -s http://169.254.169.254/latest/meta-data/instance-id").replace(" ","")

PublicIP = subprocess.getoutput("curl -s http://169.254.169.254/latest/meta-data/public-ipv4").replace(" ","")
if PublicIP == "":
    PublicIP = "N/A"

PrivateIP = subprocess.getoutput("curl -s http://169.254.169.254/latest/meta-data/local-ipv4").replace(" ","")

AZ = subprocess.getoutput("curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone/").replace(" ","")

print ("<br />")
print ("<br />")
print ("<br />")
print ("<br />")

homer=center(img(src="https://github.com/ezzobad/ted/raw/master/woohoo.jpg",align="middle",style="width:250;height:200;"))
print (homer)
print ("<br />")
print ('<html>')
print ('<head> <style> table, th, td { border: 1px solid brown; } </style> </head>')
print ('<body> <div align="center"> <table bgcolor="#e6ffcc" cellpadding="5" cellspacing="0">')

print ('<tr> <th bgcolor= #ffd1b3><font size="5" color="black">Instance ID</font></th>')
print ('<th bgcolor= #ffd1b3><font size="5" color="black">Public IP</font></th>')
print ('<th bgcolor= #ffd1b3><font size="5" color="black">Private IP</font></th>')
print ('<th bgcolor= #ffd1b3><font size="5" color="black">Availability Zone</font></th>')
print ('<tr color="#804000" align="center">')
print ('<td><font size="5">'+InstanceID+'</font></td>')
print ('<td><font size="5">'+PublicIP+'</font></td>')
print ('<td><font size="5">'+PrivateIP+'</font></td>')
print ('<td> <font size="5">'+AZ+'</font></td>')
print ('</tr>')
print ('</table>')
print ("<br />")
print ("<br />")
timestamp=strftime("%Y-%m-%d %H:%M:%S", gmtime())
print ('<font size="5">'+timestamp+'</font>')
print ('</div>')
print ('</body>')
print ('</html>')
