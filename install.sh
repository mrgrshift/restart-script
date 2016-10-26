#!/bin/bash

SHIFT_DIRECTORY=~/shift
SCRIPT=$SHIFT_DIRECTORY/restart_script.sh
SCREEN_NAME="shift_reboot"
USER=${USER:=$(/usr/bin/id -run)}

function check_installation(){
echo -n "Checking shift installation...";
if [ ! -f "$SHIFT_DIRECTORY/app.js" ]; then
  echo "Error: Please consider to install shift first"
  exit 1
fi

echo -e "done.";
}

function make_restart_script(){
	echo -n "Creating restart_script.sh...";
	echo "#!/bin/bash" > $SCRIPT;
	echo "export HOME=$SHIFT_DIRECTORY" >> $SCRIPT;
	echo "cd $SHIFT_DIRECTORY" >> $SCRIPT;
	echo "node $SHIFT_DIRECTORY/app.js" >> $SCRIPT;
	sudo chmod u+x $SCRIPT
	echo -e "done.";
}

function edit_rclocal(){
	echo -n "Preparing rc.local...";
	echo "echo \"#!/bin/sh -e\" > /etc/rc.local | sudo tee -a /etc/rc.local > /dev/null" > temp.sh
	echo "echo \"/bin/su $USER -c \\\"cd $SHIFT_DIRECTORY; /usr/bin/screen -dmS $SCREEN_NAME bash -c '$SCRIPT; exec bash'\\\" >> /etc/rc.local\" | sudo tee -a /etc/rc.local > /dev/null" >> temp.sh 
	echo "echo \"exit 0\" >> /etc/rc.local | sudo tee -a /etc/rc.local > /dev/null" >> temp.sh
	sudo bash temp.sh
	echo -e "done.";
	rm temp.sh
}



check_installation
make_restart_script
edit_rclocal

echo "*** INSTALLATION COMPLETE ***"

