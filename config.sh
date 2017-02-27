#!/bin/bash
set -e

#################### INSTALL FATEST ANTERGOS MIRRORS ####################
sudo rankmirrors -n 0 /etc/pacman.d/antergos-mirrorlist > /tmp/antergos-mirrorlist && sudo cp /tmp/antergos-mirrorlist /etc/pacman.d
cat /etc/pacman.d/antergos-mirrorlist
sudo pacman -Syu


#################### INSTALL FASTEST ARCH MIRRORS #############
sudo pacman -S --noconfirm --needed reflector
sudo reflector -l 100 -f 50 --sort rate --threads 5 --verbose --save /tmp/mirrorlist.new && rankmirrors -n 0 /tmp/mirrorlist.new > /tmp/mirrorlist && sudo cp /tmp/mirrorlist /etc/pacman.d
cat /etc/pacman.d/mirrorlist
sudo pacman -Syu


#################### INSTALL XORG-INTEL ####################
sudo pacman -S --noconfirm --needed xorg-server xorg-server-utils xorg-xinit xorg-twm xterm 
sudo pacman -S --noconfirm --needed xf86-video-intel 


#################### INSTALL PACKER FOR AUR MAKE BUILD ####################
sudo pacman -S wget --needed --noconfirm
package="packer"
command="packer"
#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

	echo "################################################################"
	echo "################## "$package" is already installed"
	echo "################################################################"

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
		echo "################################################################"
		echo "#########  "$package" has been installed"
		echo "################################################################"
	else
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "!!!!!!!!!  "$package" has NOT been installed"
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	fi
fi


#################### INSTALL i3wm CORE ####################
sudo pacman -S --noconfirm --needed i3lock i3status 

package="j4-dmenu-desktop"
#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then
	echo "################################################################"
	echo "################## "$package" is already installed"
	echo "################################################################"
else
	#checking which helper is installed
	if pacman -Qi packer &> /dev/null; then
		echo "Installing with packer"
		packer -S --noconfirm --noedit  $package
	elif pacman -Qi pacaur &> /dev/null; then
		echo "Installing with pacaur"
		pacaur -S --noconfirm --noedit  $package
	elif pacman -Qi yaourt &> /dev/null; then
		echo "Installing with yaourt"
		yaourt -S --noconfirm $package
	fi
fi

package="i3blocks"
#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then
	echo "################################################################"
	echo "################## "$package" is already installed"
	echo "################################################################"
else
	#checking which helper is installed
	if pacman -Qi packer &> /dev/null; then
		echo "Installing with packer"
		packer -S --noconfirm --noedit  $package
	elif pacman -Qi pacaur &> /dev/null; then
		echo "Installing with pacaur"
		pacaur -S --noconfirm --noedit  $package
	elif pacman -Qi yaourt &> /dev/null; then
		echo "Installing with yaourt"
		yaourt -S --noconfirm $package
	fi
	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then
		echo "################################################################"
		echo "#########  "$package" has been installed"
		echo "################################################################"
	else
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "!!!!!!!!!  "$package" has NOT been installed"
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	fi
fi

package="i3-gaps-next-git"
#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then
	echo "################################################################"
	echo "################## "$package" is already installed"
	echo "################################################################"
else
	#checking which helper is installed
	if pacman -Qi packer &> /dev/null; then
		echo "Installing with packer"
		packer -S --noconfirm --noedit  $package
	elif pacman -Qi pacaur &> /dev/null; then
		echo "Installing with pacaur"
		pacaur -S --noconfirm --noedit  $package
	elif pacman -Qi yaourt &> /dev/null; then
		echo "Installing with yaourt"
		yaourt -S --noconfirm $package
	fi
	# Just checking if installation was successful
		if pacman -Qi $package &> /dev/null; then
		echo "################################################################"
		echo "#########  "$package" has been installed"
		echo "################################################################"
	else
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "!!!!!!!!!  "$package" has NOT been installed"
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	fi
fi


#################### COPY i3 CONFIG FILES ####################
sudo cp -r i3 ~/.config/i3


#################### INSTALL SOFTWARE FROM OFFICIAL REPO ####################
sudo pacman -S --noconfirm --needed baobab bleachbit catfish clementine conky curl
sudo pacman -S --noconfirm --needed dconf-editor dmidecode
sudo pacman -S --noconfirm --needed evince firefox
sudo pacman -S --noconfirm --needed galculator gimp gksu glances  
sudo pacman -S --noconfirm --needed gnome-font-viewer gparted 
sudo pacman -S --noconfirm --needed hardinfo hddtemp htop 
sudo pacman -S --noconfirm --needed lm_sensors lsb-release meld mlocate
sudo pacman -S --noconfirm --needed net-tools notify-osd numlockx polkit-gnome 
sudo pacman -S --noconfirm --needed rxvt-unicode redshift ristretto screenfetch scrot  
sudo pacman -S --noconfirm --needed thunar tumbler
sudo pacman -S --noconfirm --needed vim vlc vnstat unclutter
sudo pacman -S --noconfirm --needed unace unrar zip unzip sharutils  uudeview  arj cabextract file-roller


sudo systemctl enable vnstat
sudo systemctl start vnstat


#################### URXVT CONFIG ####################
sudo cp -r .Xdefaults ~/


#################### INSTALL EXTRA ####################
package="google-chrome"
command="google-chrome"
if pacman -Qi $package &> /dev/null; then
	echo "########## "$package" is already installed ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "########## "$package" has been installed ##########"
	else
		echo "!!!!!!!!!! "$package" has NOT been installed !!!!!!!!!!"
	fi
fi

package="dropbox"
command="dropbox"
if pacman -Qi $package &> /dev/null; then
	echo "########## "$package" is already installed ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "########## "$package" has been installed ##########"
	else
		echo "!!!!!!!!!! "$package" has NOT been installed !!!!!!!!!!"
	fi
fi

package="spotify"
command="spotify"
if pacman -Qi $package &> /dev/null; then
	echo "########## "$package" is already installed ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "########## "$package" has been installed ##########"
	else
		echo "!!!!!!!!!! "$package" has NOT been installed !!!!!!!!!!"
	fi
fi

package="franz-bin"
command="franz-bin"
if pacman -Qi $package &> /dev/null; then
	echo "########## "$package" is already installed ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "########## "$package" has been installed ##########"
	else
		echo "!!!!!!!!!! "$package" has NOT been installed !!!!!!!!!!"
	fi
fi

package="jdownloader2"
command="jdownloader2"
if pacman -Qi $package &> /dev/null; then
	echo "########## "$package" is already installed ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "########## "$package" has been installed ##########"
	else
		echo "!!!!!!!!!! "$package" has NOT been installed !!!!!!!!!!"
	fi
fi

package="sublime-text-dev"
command="subl3"
if pacman -Qi $package &> /dev/null; then
	echo "########## "$package" is already installed ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "########## "$package" has been installed ##########"
	else
		echo "!!!!!!!!!! "$package" has NOT been installed !!!!!!!!!!"
	fi
fi

sudo pacman -S --needed --noconfirm xdg-user-dirs
[ -d /tmp/hardcode-fixer ] && rm -rf "/tmp/hardcode-fixer" || echo ""
git clone https://github.com/Foggalong/hardcode-fixer /tmp/hardcode-fixer
sudo /tmp/hardcode-fixer/fix.sh
rm -rf /tmp/hardcode-fixer

package="ttf-font-awesome"
if pacman -Qi $package &> /dev/null; then
	echo "########## "$package" is already installed ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "########## "$package" has been installed ##########"
	else
		echo "!!!!!!!!!! "$package" has NOT been installed !!!!!!!!!!"
	fi
fi

package="pa-applet-git"
if pacman -Qi $package &> /dev/null; then
	echo "########## "$package" is already installed ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "########## "$package" has been installed ##########"
	else
		echo "!!!!!!!!!! "$package" has NOT been installed !!!!!!!!!!"
	fi
fi

package="sardi-icons"
if pacman -Qi $package &> /dev/null; then
	echo "########## "$package" is already installed ##########"
else
	packer -S --noconfirm --noedit  $package
	if pacman -Qi $package &> /dev/null; then
		echo "########## "$package" has been installed ##########"
	else
		echo "!!!!!!!!!! "$package" has NOT been installed !!!!!!!!!!"
	fi
fi

echo "Nach dem Reboot config2.sh ausführen!"
sleep 30
reboot