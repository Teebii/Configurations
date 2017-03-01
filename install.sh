#!/bin/bash
set -e
#=======================================================================================================================#
#====================================== INSTALL FATEST ANTERGOS MIRRORS ================================================#
echo "############################################################"
echo "##########  Installing fastest Antergos mirrors   ##########"
sudo rankmirrors -n 0 /etc/pacman.d/antergos-mirrorlist > /tmp/antergos-mirrorlist && sudo cp /tmp/antergos-mirrorlist /etc/pacman.d
cat /etc/pacman.d/antergos-mirrorlist
sudo pacman -Syu
echo "##########              Successful!               ##########"
echo ""


#======================================== INSTALL FATEST ARCH MIRRORS ==================================================#
echo "############################################################"
echo "##########    Installing fastest Arch mirrors     ##########"
sudo pacman -S --noconfirm --needed reflector
sudo reflector -l 100 -f 50 --sort rate --threads 5 --verbose --save /tmp/mirrorlist.new && rankmirrors -n 0 /tmp/mirrorlist.new > /tmp/mirrorlist && sudo cp /tmp/mirrorlist /etc/pacman.d
cat /etc/pacman.d/mirrorlist
sudo pacman -Syu
echo "##########              Successful!               ##########"
echo ""


#============================================ INSTALL XORG-INTEL =======================================================#
echo "############################################################"
echo "##########        Installing xorg-intel           ##########"
sudo pacman -S --noconfirm --needed xorg-server xorg-server-utils xorg-xinit xorg-twm xterm 
sudo pacman -S --noconfirm --needed xf86-video-intel 
echo "##########              Successful!               ##########"
echo ""


#==================================== INSTALL PACKER FOR AUR MAKE BUILD ================================================#
echo "############################################################"
echo "##########           Installing wget              ##########"
sudo pacman -S wget --needed --noconfirm
echo "##########              Successful!               ##########"
echo ""

echo "############################################################"
echo "##########          Installing packer             ##########"
package="packer"
command="packer"
#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	sudo pacman -S --noconfirm --needed grep sed bash curl pacman jshon expac
	[ -d /tmp/packer ] && rm -rf /tmp/packer
	mkdir /tmp/packer
	wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
	mv PKGBUILD\?h\=packer /tmp/packer/PKGBUILD
	cd /tmp/packer
	makepkg -i /tmp/packer --noconfirm
	[ -d /tmp/packer ] && rm -rf /tmp/packer
	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""


#============================================ INSTALL i3wm CORE ========================================================#
echo "############################################################"
echo "##########         Installing i3wm core           ##########"
sudo pacman -S --noconfirm --needed i3lock i3status 
echo "##########              Successful!               ##########"
echo ""

echo "############################################################"
echo "##########      Installing j4-dmenu-desktop       ##########"
package="j4-dmenu-desktop"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########          Installing i3blocks           ##########"
package="i3blocks"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########       Installing i3-gaps-next-git      ##########"
package="i3-gaps-next-git"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""


#============================================ COPY i3 CONFIG FILES =====================================================#
echo "############################################################"
echo "##########        Copying i3 config files         ##########"
sudo mkdir -p ~/.config/i3/
sudo cp -R /i3/* ~/.config/i3/
echo "##########              Successful!               ##########"
echo ""


#==================================== INSTALL SOFTWARE FROM OFFICIAL REPO ===============================================#
echo "############################################################"
echo "##########      Installing official software      ##########"
sudo pacman -S --noconfirm --needed baobab bleachbit blueman catfish clementine conky curl dconf-editor dmidecode evince firefox galculator gimp gksu glances gnome-font-viewer gparted hardinfo hddtemp htop lm_sensors lsb-release meld mlocate net-tools notify-osd numlockx polkit-gnome pulseaudio rxvt-unicode redshift ristretto screenfetch scrot thunar thunderbird tumbler vim vlc vnstat xbindkeys unclutter
echo "##########              Successful!               ##########"
echo ""

echo "############################################################"
echo "##########        Installing unzip software       ##########"
sudo pacman -S --noconfirm --needed unace unrar zip unzip sharutils  uudeview  arj cabextract file-roller
echo "##########              Successful!               ##########"
echo ""

echo "############################################################"
echo "##########              Start vnstat              ##########"
sudo systemctl enable vnstat
sudo systemctl start vnstat
echo "##########              Successful!               ##########"
echo ""


#================================================ URXVT CONFIG ==========================================================#
echo "############################################################"
echo "##########           Copying .Xdefaults           ##########"
sudo cp -r .Xdefaults ~/
echo "##########              Successful!               ##########"
echo ""


#===================================== INSTALL SOFTWARE FROM EXTRA REPO =================================================#
echo "############################################################"
echo "##########        Installing Google-Chrome        ##########"
package="google-chrome"
command="google-chrome"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########           Installing Dropbox           ##########"
package="dropbox"
command="dropbox"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########           Installing Spotify           ##########"
package="spotify"
command="spotify"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########       Installing Franz-Messenger       ##########"
package="franz-bin"
command="franz"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########         Installing JDownloader2        ##########"
package="jdownloader2"
command="jdownloader2"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########         Installing Sublime Text        ##########"
package="sublime-text-dev"
command="subl3"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########       Installing ttf-font-awesome      ##########"
package="ttf-font-awesome"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########        Installing pa-applet-git        ##########"
package="pa-applet-git"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""

echo "############################################################"
echo "##########    Installing network-manager-applet   ##########"
package="network-manager-applet"
if pacman -Qi $package &> /dev/null; then
	echo "##########            Already installed!              ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "##########              Successful!               ##########"
	else
		echo "##########                Failed!                 ##########"
	fi
fi
echo ""


#============================================== INSTALL LIGHTDM ========================================================#
echo "############################################################"
echo "##########           Installing LightDM           ##########"
sudo pacman -S --noconfirm --needed lightdm --force
sudo pacman -S --noconfirm --needed lightdm-gtk-greeter
sudo pacman -S --noconfirm --needed lightdm-gtk-greeter-settings

sudo rm /etc/lightdm/lightdm.conf
sudo cp -r lightdm.conf /etc/lightdm/
sudo systemctl enable lightdm.service

sudo cp -r wallpaper.jpg /usr/share/pixmaps/
sudo cp -r lightdm-gtk-greeter.conf /etc/lightdm/
echo "##########              Successful!               ##########"
echo ""


#======================================== INSTALL PARCELLITE CLIPBOARD =================================================#
echo "############################################################"
echo "##########          Installing Parcellite         ##########"
sudo pacman -S --noconfirm --needed parcellite
echo "##########              Successful!               ##########"
echo ""


#=============================================== TOUCHPAD CONFIG =======================================================#
echo "############################################################"
echo "########## Installing Synaptics and copying config##########"
sudo pacman -S --noconfirm --needed xf86-input-synaptics
sudo cp -r 50-synaptics.conf /etc/X11/xorg.conf.d/
echo "##########              Successful!               ##########"
echo ""


#============================================ MANUPULATING TIME ========================================================#
echo "############################################################"
echo "##########           Manupulating TIME            ##########"
sudo ln -sf /usr/share/zoneinfo/CET /etc/localtime
echo "##########              Successful!               ##########"
echo ""


#============================================ MANUPULATING GRUB ========================================================#
echo "############################################################"
echo "##########           Manupulating GRUB            ##########"
sudo cp -r grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "##########              Successful!               ##########"
echo ""

echo "############################################################"
echo "##########    After reboot execute config2.sh!    ##########"
echo "############################################################"
sleep 30
reboot
#=======================================================================================================================#