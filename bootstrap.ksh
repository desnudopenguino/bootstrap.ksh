#!/bin/ksh

echo "Bootstrap.ksh - tweaks some settings and bootstraps dotfiles and other files needed for my development environment in OpenBSD\n"
me=`whoami`
if [[ $me -eq "root" ]]; then
echo "Must be root to run this script\n"
else
	echo "Installing packages...\n"
	pkg_add -Im sudo vim git i3 ranger pcmanfm irssi feh compton firefox iridium thunderbird gimp inkscape zip unzip bitlbee xpdf ranger rxvt-unicode scrot wget texlive expect cadaver
	if [[ -e $1 ]]; then
		user=$1
		echo "Logging in as $user..."
		su $user
		cd /home/$user
		echo "Cloning dotfiles from desnudopenguion/dotfiles...\n"
		git clone https://github.com/desnudopenguino/dotfiles.git dotfiles
		cd dotfiles
		echo "Installing dotfiles...\n"
		./install.sh
		echo "Sourcing .kshrc...\n"
		. .kshrc
		echo "Getting work/project specific files...\n"
		cd /home/$user
		echo "ENTER: get bootstrap.bak to download local config files\n"
		box 
		echo "Decript bootstrap.bak...\n"
		dec bootstrap.bak bootstrap.zip
		echo "Unzipping bootstrap.zip...\n"
		unzip bootstrap.zip
		echo "Sourcing .profile...\n"
		. .profile
		echo "Finished (hopefully). Now you can do it all!\n\n"
	fi
fi
