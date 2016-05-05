#!/bin/ksh

echo "Bootstrap.ksh - tweaks some settings and bootstraps dotfiles and other files needed for my development environment in OpenBSD\n"
echo "SUing into root to install packages...\n"
su root -c 'pkg_add -Im sudo vim git i3 ranger pcmanfm irssi feh compton firefox iridium thunderbird gimp inkscape zip unzip bitlbee xpdf ranger rxvt-unicode scrot wget expect cadaver; vim /etc/X11/xdm/Xsetup_0 -c "%s/xconsole/\#xconsole" -c "wq"; visudo; exit'
cd ~
echo "Cloning dotfiles from desnudopenguion/dotfiles...\n"
git clone https://github.com/desnudopenguino/dotfiles.git dotfiles
cd dotfiles
echo "Installing dotfiles...\n"
./install.sh
echo "Getting work/project specific files...\n"
cd ~
echo "Getting the rest of the files...\n"
echo "ENTER: get bootstrap.bak to download local config files\n"
box
echo "Decrypt bootstrap.bak to bootstrap.zip...\n"
dec bootstrap.bak bootstrap.zip
echo "Unzipping bootstrap.zip...\n"
unzip bootstrap.zip
echo "Sourcing .profile...\n"
. .profile
echo "Finished (hopefully). Now you can do it all!\n"
echo "NOTE: You must enable sudo on this account, and if you want the xconsole removed, you must comment it out in (/etc/X11/xdm/Xsetup_0)\n\n"
