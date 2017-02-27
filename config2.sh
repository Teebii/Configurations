#################### INSTALL DISTRO SPECIFIC SOFTWARE ####################
# Fonts
sudo pacman -S noto-fonts --noconfirm --needed
sudo pacman -S ttf-ubuntu-font-family --noconfirm --needed
sudo pacman -S ttf-droid --noconfirm --noconfirm --needed
sudo pacman -S ttf-inconsolata --noconfirm --needed
sudo pacman -S arandr --noconfirm --needed
sudo pacman -S qt4 --confirm --needed
sudo pacman -S xorg-xrandr --noconfirm --needed
sudo pacman -S gvfs  --noconfirm --needed
sudo pacman -S compton  --noconfirm --needed
sudo pacman -S volumeicon  --noconfirm --needed

package="playerctl"
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

package="pasystray-git"
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


#################### INSTALL LIGHTDM ####################
sudo pacman -S --noconfirm --needed lightdm --force
sudo pacman -S --noconfirm --needed lightdm-gtk-greeter
sudo pacman -S --noconfirm --needed lightdm-gtk-greeter-settings

sudo rm /etc/lightdm/lightdm.conf
sudo cp -r lightdm.conf /etc/lightdm/
sudo systemctl enable lightdm.service


#################### TOUCHPAD CONFIG ####################
sudo pacman -S --noconfirm --needed xf86-input-synaptics
sudo cp -r 50-synaptics.conf /etc/X11/xorg.conf.d/


#################### BACKGROUND WITH FEH ####################
sudo cp -r wallpaper.jpg ~/Bilder/
sudo pacman -S --noconfirm --needed feh
feh --bg-center ~/Bilder/wallpaper.jpg


#################### INSTALL LaTeX ####################
sudo pacman -S --noconfirm --needed texlive-most
sudo pacman -S --noconfirm --needed texlive-lang
sudo pacman -S --noconfirm --needed texstudio


#################### INSTALL PARCELLITE CLIPBOARD ####################
sudo pacman -S --noconfirm --needed parcellite


#################### INSTALL JDK8 ####################
sudo pacman -S --noconfirm --needed jdk8-openjdk


#################### INSTALL JDK8 ####################
package = "intel-opencl-runtime"
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

sudo pacman -S --noconfirm --needed opencl-headers

package = "intel-opencl-sdk"
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

echo "############################################################"
echo "##########       Installation vollständig!        ##########"
echo "############################################################"