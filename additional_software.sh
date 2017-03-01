#=======================================================================================================================#
#====================================== INSTALL DISTRO SPECIFIC SOFTWARE ===============================================#
echo "############################################################"
echo "##########           Installing Fonts             ##########"
sudo pacman -S --noconfirm --needed noto-fonts ttf-ubuntu-font-family ttf-droid ttf-inconsolata 
echo "##########              Successful!               ##########"
echo ""

echo "############################################################"
echo "##########          Installing Software           ##########"
sudo pacman -S --noconfirm --needed arandr qt4 xorg-xrandr gvfs compton volumeicon
echo "##########              Successful!               ##########"
echo ""

echo "############################################################"
echo "##########          Installing playerctl          ##########"
package="playerctl"
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
echo "##########         Installing sardi-icons         ##########"
package="sardi-icons"
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
echo "##########          Hardcoded Icon Fixer!         ##########"
sudo pacman -S --needed --noconfirm xdg-user-dirs
[ -d /tmp/hardcode-fixer ] && rm -rf "/tmp/hardcode-fixer" || echo ""
git clone https://github.com/Foggalong/hardcode-fixer /tmp/hardcode-fixer
sudo /tmp/hardcode-fixer/fix.sh
rm -rf /tmp/hardcode-fixer
echo "##########              Successful!               ##########"
echo ""

echo "############################################################"
echo "##########        Installing pasystray-git        ##########"
package="pasystray-git"
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


#================================================ INSTALL LaTeX ========================================================#
echo "############################################################"
echo "##########            Installing LaTeX            ##########"
sudo pacman -S --noconfirm --needed texlive-most texlive-lang texstudio
echo "##########              Successful!               ##########"
echo ""


#============================================== INSTALL OPEN-JDK8 ======================================================#
echo "############################################################"
echo "##########          Installing Open-JDK8          ##########"
sudo pacman -S --noconfirm --needed jdk8-openjdk
echo "##########              Successful!               ##########"
echo ""


#=============================================== INSTALL OPENCL ========================================================#
echo "############################################################"
echo "##########     Installing intel-opencl-runtime    ##########"
package="intel-opencl-runtime"
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
echo "##########        Installing OpenCL-Headers       ##########"
sudo pacman -S --noconfirm --needed opencl-headers
echo "##########              Successful!               ##########"
echo ""

echo "############################################################"
echo "##########       Installing intel-opencl-sdk      ##########"
package="intel-opencl-sdk"
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
echo "##########       Installation vollständig!        ##########"
echo "############################################################"
#=======================================================================================================================#