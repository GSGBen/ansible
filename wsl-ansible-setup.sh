#!/bin/sh
#http://docs.ansible.com/ansible/latest/intro_windows.html

#Sets up ansible on Windows Subsystem for Linux (Ubuntu/Bash running on Windows 10/Server 2016)

#Settings
Username="<your WSL username>"
GitRepository="<your ansible repository>"
GitName="<your git name>"
GitEmail="<your git email>"

#Configure git
git config --global user.name $GitName
git config --global user.email $GitEmail

#Install the python package manager to get pywinrm, required for windows management. Also use it for ansible now
sudo update
sudo apt-get install python-pip git libffi-dev libssl-dev -y
pip install pywinrm
#Formerly 'sudo apt-get install ansible' but it gives an older version
sudo pip install ansible

#Remove the existing ansible folder and replace it with your own
#Comment out these lines if you don't have an existing ansible git repository
cd /etc
sudo rm -r ansible
sudo git clone $GitRepository

#Take ownership of the ansible folders. Not needed now - the git clone gives read on files
#sudo chown -R $Username /etc/ansible
#sudo chmod -R 777 /etc/ansible

#Bonus: fix dark blue and backspace sound on windows bash
#https://medium.com/@iraklis/fixing-dark-blue-colors-on-windows-10-ubuntu-bash-c6b009f8b97c
#Not needed anymore - use ColorTool (https://github.com/GSGBen/console - fork with prebuilt .exe) instead
#
#if grep -q Microsoft /proc/version; then
    ##cd by itself goes home
    #cd 
    #LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
    #export LS_COLORS
    #echo “set bell-style none” >> .inputrc
#fi

echo "Run https://github.com/ansible/ansible/blob/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 on your windows hosts. Lock down the firewall rule to specific IPs only too."
