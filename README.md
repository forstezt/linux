Linux Mint Setup Directions
===========================

#set up some basic programs and mount drives
1) Run mint_init_setup.sh
2) Run vpnsetup.sh
3) Run the following command in the terminal: sudo mount -a 

#install current version of eclipse
4) Download newest version of Eclipse from Oracle's Web site (repository version is outdated)
5)   

#configure irssi to connect to the #uwec-cs channel
6) Open irssi
7) Enter the following command: /server add -auto -network Freenode irc.freenode.net 6667
8) Enter the following command: /channel add -auto #uwec-cs Freenode
9) Enter the following command: /network add -autosendcmd "/msg nickserv identify #CoconutPie ;wait 2000" Freenode
