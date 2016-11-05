# restart-script
Easy installation for SHIFT restart-script on startup.

#Purpose
This script is for when your vps providers decides on their own restart your server. Then you need a way to restart your node, this script help you accomplish that, will restart your node in the server startup.

#IMPORTANT NOTICE
<b>This script is for really new vps installation.</b><br>
<b>This script will remove everything from rc.local to let only this script starts.</b><br>
<b>This script is intented for newbies.</b><br>
<b>This script works with Ubuntu 14.04</b>

#Requisites

  - sudo privileges
  - shift installed
  - screen installed (sudo apt-get screen)
  
#Installation
Simply run the following commands:<br>
```
cd ~/
git clone https://github.com/mrgrshift/restart-script
cd restart-script
bash install.sh
```

<br>
<br>
##Side notes
If you are running a newer version of Ubuntu you need to check if rc.local is no longer used. If so, you need to do an extra configuration. Ubuntu newer versions are now using systemd, and rc.local is now considered a service and it is turned off by default. You can turn rc.local "on" doing the following steps:
```
sudo nano /etc/systemd/system/rc-local.service
```
And add the following content to it and save it:
```
[Unit]
 Description=/etc/rc.local Compatibility
 ConditionPathExists=/etc/rc.local

[Service]
 Type=forking
 ExecStart=/etc/rc.local start
 TimeoutSec=0
 StandardOutput=tty
 RemainAfterExit=yes
 SysVStartPriority=99

[Install]
 WantedBy=multi-user.target
```
After that make sure that /etc/rc.local file is executable, and enable the service:
```
sudo chmod +x /etc/rc.local
sudo systemctl enable rc-local
```
Now the last part, start the service:
```
sudo systemctl start rc-local.service
```
