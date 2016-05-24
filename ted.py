#!/usr/bin/python34

from htmltag import img, center
from time import gmtime, strftime

print("Content-Type: text/html;charset=utf-8")
print("")
print ("<br />")
print ("<br />")
print ("<br />")
print ("<br />")

InstanceID="i-0b8e956b660ce3568"
PublicIP="N/A"
PrivateIP="10.0.1.23"
AZ="us-east-1"

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
timestamp=strftime("%Y-%m-%d %H:%M:%S", gmtime())
print ('<font size="5">'+timestamp+'</font>')
print ('</div>')
print ('</body>')
print ('</html>')
