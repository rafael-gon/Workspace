git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

git clone https://aur.archlinux.org/alacritty-ligatures-git.git
cd alacritty-ligatures-git
makepkg -si --nocheck
cd ..
rm -rf alacritty-ligatures-git

git clone https://aur.archlinux.org/nerd-fonts-git.git
cd nerd-fonts-git
makepkg -si
cd ..
rm -rf nerd-fonts-git

git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si
cd ..
rm -rf visual-studio-code-bin

git clone https://aur.archlinux.org/ulauncher.git
cd ulauncher
makepkg -si
cd ..
rm -rf ulauncher

git clone https://aur.archlinux.org/ly.git
cd ly
makepkg -si
cd ..
rm -rf ly

sudo systemctl enable ly.service

git clone https://aur.archlinux.org/asdf-vm.git
cd asdf-vm
makepkg -si
cd ..
rm -rf asdf-vm

git clone https://aur.archlinux.org/swaylock-effects.git
cd swaylock-effects
makepkg -si
cd ..
rm -rf swaylock-effects

git clone https://aur.archlinux.org/avizo.git
cd avizo
makepkg -si
cd ..
rm -rf avizo