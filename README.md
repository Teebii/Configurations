# README
## Creating a bootable stick
1. Go to [Antergos Website](https://antergos.com/try-it/) and download the .iso-file
2. Make a Live-USB-Stick (with Linux using `dd`)
    * check with `sudo fdisk -l` which device is your USB stick
    * then use `sudo dd bs=4M if=/path/to/antergos-x86_64.iso of=/dev/sdX && sync`
        * `/dev/sdX` is **your** USB device
        * wait until `dd` is finished *(there is no statusbar)*
    * Your bootable Live-USB-Stick **is ready!**
3. *Make sure you saved __everything__ from your computer __before__ following the installation instructions*

## Installation
1. Boot from your bootable device
2. Select with `F2` your preferred language and boot Antergos
3. Make sure your computer is __connected to the internet__ and you have __enough power__
4. Follow the installation helper and select the `BASE` version (it means no preinstalled window manager)
5. Follow the installation helper and select your preferred options
    * I selected `AUR`, `Extra Truetype Fonts` and `Printing Support`
6. Follow the instructions and reboot after installation

## First steps with BASE
1. Login
2. Enable the NetworkManager
    * `systemctl enable NetworkManager`
3. Login in your WLAN with `sudo wifi-menu`
    * choose your network, enter password and save
4. reboot

## Clone this repository and get started
1. Login
2. Clone this repository
    * `git clone https://github.com/thixxsuckz/Configurations.git`
3. change directory to the cloned repository
    * `cd Configurations/`
4. run install.sh
    * `./install.sh`
5. Now you can lean back and wait, the script reboots automaticaly 30 seconds after it is done
6. After rebooting you should see the `light-dm-greeter`
7. Login and enjoy i3

## Install additional software
1. change directory to the cloned repository
    * `cd Configurations/`
2. run additional_software.sh
    * `./additional_software.sh`
3. **_Enjoy even more!_**

## I give no warranty that this script runs fine on your computer! Feel free to read the bash scripts and change it as you wish! The same applies to the other files!
