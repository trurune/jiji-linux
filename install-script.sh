echo "Welcome to the Jiji Linux Setup Environemnt (JLSE)"
echo "STEP 1. MIRRORS"
echo "The JiJi Linux tarball is assatained elsewhere from the github due to file size limitations, as a result, we require you to get the file from a mirror"
echo "You can use the official mirror (reccomended for the most recent releases) or use another mirror, depending on region, this may be beneficial"
echo "NOTE FOR SYSADMINS: If you are deploying JiJi Linux on multiple systems, I'd HIGHLY suggest you run your own mirror"
echo "Our official mirror currently operates in London, United Kingdom"
echo "Choose an option"
echo "1) Use official mirror"
echo "2) Use my own mirror"
read $MIRRORCHOICE

if [ $MIRRORCHOICE == 1 ]
then
export MIRROR="86.15.113.82"
else
read $MIRROR
fi

echo "Which version of JiJi would you like to use (lite)"
read VER


echo "Downloading tarball"
wget $MIRROR/jiji-amd64-$VER.tar.xz
tar xpvf jiji-amd64-$VER.tar.xz
arch-chroot . grub-install
arch-chroot . grub-mkconfig /boot/grub/grub.cfg
echo "Enter a root password"
arch-chroot . passwd
echo "Enter a username"
read NAME
useradd -m -G wheel $NAME
echo "Enter a password for your new user"
passwd $NAME

echo "Installation finished. Rebooting..."
reboot

