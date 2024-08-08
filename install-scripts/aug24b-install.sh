echo Downloading stage files
wget https://github.com/trurune/jiji-linux/releases/download/aug24b/jiji-linux-amd64-stage-aug24b.tar.xz.1
wget https://github.com/trurune/jiji-linux/releases/download/aug24b/jiji-linux-amd64-stage-aug24b.tar.xz.2
echo Concatenating stage files
cat jiji-linux-amd64-stage-aug24b.tar.xz.2 >> jiji-linux-amd64-stage-aug24b.tar.xz.1
echo Extracting full stage file
tar xpvf jiji-linux-amd64-stage-aug24b.tar.xz.1
echo Deleting stage files
rm jiji-linux-amd64-stage-aug24b.tar.xz.*
echo Installing GRUB
arch-chroot /mnt/gentoo grub-install
arch-chroot /mnt/gentoo grub-mkconfig -o /boot/grub/grub.cfg
echo Setting up root password:
arch-chroot /mnt/gentoo passwd
echo Setting up user account
echo What is your username?
read USER
arch-chroot /mnt/gentoo useradd -m -G wheel,video,audio,input $USER
echo Setting user password
arch-chroot /mnt/gentoo passwd $USER
echo Generating fstab
genfstab /mnt/gentoo >>> /mnt/gentoo/etc/fstab
