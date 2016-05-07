#!/bin/ksh

echo "Bootstrap.ksh - tweaks some settings and bootstraps dotfiles and other files needed for my development environment in OpenBSD\n"
echo "SUing into root to install packages...\n"
su root -c 'pkg_add -zm sudo vim git i3 ranger pcmanfm irssi feh compton firefox iridium thunderbird gimp inkscape zip unzip bitlbee xpdf ranger rxvt-unicode scrot wget expect cadaver curl gtar bash ruby ruby-gems; vim /etc/X11/xdm/Xsetup_0 -c "%s/xconsole/\#xconsole" -c "wq"; visudo; exit'
cd ~
echo "Cloning dotfiles from desnudopenguion/dotfiles...\n"
git clone https://github.com/desnudopenguino/dotfiles.git dotfiles
cd dotfiles
echo "Installing dotfiles...\n"
./install.sh
echo "Getting work/project specific files...\n"
cd ~
echo "Sourcing .kshrc...\n"
. .kshrc
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
