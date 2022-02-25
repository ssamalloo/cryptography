#! /bin/bash

#checking if ~/src already exists and if not create it.
if [[ -d ~/src ]] 
then
	echo "Src folder already exist."
else 
	sudo mkdir ~/src 	
fi

#going to the src folder and checking if cryptography has already been clone there and if not, clone it.
cd ~/src 
if [[ -d ~/src/cryptography ]]
then
	echo "Swathi's repository has already been cloned to src folder."
else 
	sudo git clone https://github.com/ssamalloo/cryptography.git
fi

cd ~/cryptography/bin
sudo chmod +x crypt.sh #give executable rights
sudo chmod +x decrypt.sh #give executable rights

sudo cp -f ~/cryptography/bin/crypt.service /etc/systemd/system/crypt.service
sudo chmod 644 /etc/systemd/system/crypt.service

sudo cp -f ~/cryptography/bin/decrypt.service /etc/systemd/system/decrypt.service
sudo chmod 644 /etc/systemd/system/decrypt.service

sudo sudo systemctl start crypt.service
sudo sudo systemctl enable crypt.service
sudo sudo systemctl start decrypt.service
sudo sudo systemctl enable decrypt.service



echo -e " \e[5mInstallation Completed \e[25m!"
