sudo pacman -Syyuu git 

git clone https://aur.archlinux.org/swayfx-git.git
cd swayfx-git
makepkg -si
cd ..
rm -rf swayfx-git

sudo timedatectl set-ntp true

