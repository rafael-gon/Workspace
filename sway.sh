sudo pacman -Syyuu git

sudo timedatectl set-ntp true

cd /tmp

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
