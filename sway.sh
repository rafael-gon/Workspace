sudo pacman -Syyuu git

sudo timedatectl set-ntp true

cd /tmp

git clone https://aur.archlinux.org/swayfx-git.git
cd swayfx-git
makepkg -si --noconfirm

cd /tmp

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

cd /tmp

git clone https://aur.archlinux.org/ly.git
cd ly
makepkg -si

sudo systemctl enable ly.service

cd /tmp

git clone https://aur.archlinux.org/swaylock-effects.git
cd swaylock-effects
makepkg -si
