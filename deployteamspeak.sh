#!/bin/bash
# Created by Kristian Syrjänen 2018.
# I do not own any of the files. This is simply a bash-script by me.
# Teamspeak 3 Server, © 2018 TeamSpeak Systems GmbH All rights reserved.


echo -e "\nInitializing Teamspeak 3 Server deployment... \n" 

        apt-get update

        
echo -e "\nFetching and extracting Teamspeak 3 Server tarball... \n" 

        wget http://dl.4players.de/ts/releases/3.2.0/teamspeak3-server_linux_x86-3.2.0.tar.bz2
        tar -jxvf teamspeak3-server_linux_x86-3.2.0.tar.bz2
        
echo -e "\nMoving files around and changing ownership... \n" 

        sudo mv teamspeak3-server_linux_amd64 /usr/local/xubuntu
        sudo chown -R xubuntu:xubuntu /usr/local/xubuntu

echo -e "\nConnecting ts3server_startscript.sh with /etc/systemd/system/teamspeak... \n"

        sudo ln -s /usr/local/xubuntu/ts3server_startscript.sh /etc/systemd/system/teamspeak
        
echo -e "\nConfiguring Teamspeak to automatically run after bootup... \n"
        
        sudo update-rc.d teamspeak defaults

echo -e "\nStarting up service... \n" 

        sudo systemctl restart teamspeak

echo -e "\nGet your privilege key with: cat /usr/local/xubuntu/logs/ts3server_* \n" 
echo -e "\nSearch for the token line... \n"
