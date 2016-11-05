# restart-script
Easy installation for SHIFT restart-script on startup.

#Purpose
This script is for when your vps providers decides on their own restart your server. Then you need a way to restart your node, this script help you accomplish that, will restart your node in the server startup.

#IMPORTANT NOTICE
<b>This script is for really new vps installation.</b><br>
<b>This script will remove everything from rc.local to let only this script starts.</b><br>
<b>This script is intented for newbies.</b>

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
