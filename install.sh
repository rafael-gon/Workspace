#!/bin/bash
whiptail --title "!!! WARNING !!!" --msgbox "To use this script you will need git and yay if you chose Arch based." 10 60

geralPass=$(whiptail --title "Rafael Script" --passwordbox "Enter your password and choose Ok to continue." 10 60 3>&1 1>&2 2>&3)

#Password If
geralPassExit=$?
if [ $geralPassExit = 0 ]; then

  # instalacao das coisas basicas que vai ter no pc independente do resto

  sudo -S <<< $geralPass pacman -S git

  cd /tmp

  git clone https://aur.archlinux.org/yay.git

  cd yay

  makepkg -si --noconfirm

  cd /home/rafael

  yay -Syyuu base-devel unzip unrar exa bat wget curl ttf-fira-code docker noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra pulseaudio pulseaudio-bluetooth bluez bluez-libs bluez-plugins bluez-utils flatpak asdf-vm nerd-fonts-git qbittorrent inkscape discord pcsx2 prismlauncher yuzu melonds citra-git steam duckstation ppsspp dolphin-emu dropbox vlc visual-studio-code-bin insomnia android-studio nodejs-nativefier zsh starship alacritty --noconfirm

  sudo -S <<< $geralPass systemctl enable bluetooth

  flatpak install flathub com.stremio.Stremio -y
  
  xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-bittorrent
  xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-torrent
  xdg-mime default org.qbittorrent.qBittorrent.desktop x-scheme-handler/magnet

  mkdir -pv ~/.local/share/nativefier

  cd ~/.local/share/nativefier

  nativefier --name "WhatsApp" 'web.whatsapp.com'
  nativefier --name "notion" 'https://www.notion.so/'

  cd /home/rafael

  echo "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/home/rafael/.local/share/nativefier/WhatsApp-linux-x64/WhatsApp
Name=WhatsApp
Comment=Simple, secure, reliable messaging and calling
Icon=whatsapp" >> ~/.local/share/applications/whatsapp.desktop

  sudo -S <<< $geralPass chmod +x ~/.local/share/applications/whatsapp.desktop

  echo "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/home/rafael/.local/share/nativefier/notion-linux-x64/notion
Name=Notion
Comment=Connected workspace where better, faster work happens
Icon=notion" >> ~/.local/share/applications/notion.desktop

  sudo -S <<< $geralPass chmod +x ~/.local/share/applications/notion.desktop

  displayServer=$(whiptail --title "Rafael Script" --menu "What desktop environment do you like to use?" 15 60 2 "1" "Budgie" "2" "Deepin" "3" "GNOME" "4" "Plasma" "5" "Pantheon" "6" "Hyprland" "7" "Sway" 3>&1 1>&2 2>&3)

  displayServerExit=$?

  if [ $displayServerExit = 0 ]; then
    if [ $displayServer = 1 ]; then
      # "---------- ---------- ---------- Budgie ---------- ---------- ----------" #
      yay -S xorg budgie-desktop budgie-screensaver budgie-control-center budgie-desktop-view budgie-backgrounds network-manager-applet materia-gtk-theme papirus-icon-theme lightdm lightdm-slick-greeter lightdm-gtk-greeter --noconfirm
      sudo -S <<< $geralPass systemctl enable lightdm

    elif [ $displayServer = 2 ]; then
      # "---------- ---------- ---------- Deepin ---------- ---------- ----------" #
      yay -S xorg deepin deepin-extra lightdm lightdm-deepin-greeter lightdm-gtk-greeter --noconfirm
      sudo -S <<< $geralPass systemctl enable lightdm

    elif [ $displayServer = 3 ]; then
      # "---------- ---------- ---------- GNOME ---------- ---------- ----------" #
      yay -S xorg gnome gnome-tweaks gdm --noconfirm
      sudo -S <<< $geralPass systemctl enable gdm

    elif [ $displayServer = 4 ]; then
      # "---------- ---------- ---------- Plasma ---------- ---------- ----------" #
      yay -S xorg plasma dolphin latte-dock sddm okular ark spectacle gwenview kdeconnect libdbusmenu-glib packagekit-qt5 --noconfirm
      sudo -S <<< $geralPass systemctl enable sddm

    elif [ $displayServer = 5 ]; then
      # "---------- ---------- ---------- Pantheon ---------- ---------- ----------" #
      yay -S xorg lightdm lightdm-pantheon-greeter lightdm-gtk-greeter --noconfirm
      sudo -S <<< $geralPass systemctl enable lightdm

    elif [ $displayServer = 6 ]; then
      # "---------- ---------- ---------- Hyprland ---------- ---------- ----------" #
      yay -S hyprland-git pipewire wireplumber xdg-desktop-portal-hyprland-git thunar thunar thunar-archive-plugin thunar-media-tags-plugin thunar-shares-plugin thunar-volman tumbler-extra-thumbnailers tumbler viewnior network-manager-applet blueman mousepad grim slurp xclip wl-clipboard light brightnessctl pamixer avizo ulauncher ly --noconfirm
      sudo -S <<< $geralPass systemctl enable ly
      sudo -S <<< $geralPass timedatectl set-ntp true

    elif [ $displayServer = 7 ]; then
      # "---------- ---------- ---------- Sway ---------- ---------- ----------" #
      yay -S swayfx-git swaylock-effects thunar thunar thunar-archive-plugin thunar-media-tags-plugin thunar-shares-plugin thunar-volman tumbler-extra-thumbnailers tumbler network-manager-applet blueman swaybg swaync-git pipewire wireplumber viewnior mousepad grim slurp xclip wl-clipboard light brightnessctl pamixer avizo ulauncher ly --noconfirm
      sudo -S <<< $geralPass systemctl enable ly
      sudo -S <<< $geralPass timedatectl set-ntp true

    else
      echo "bye bye 😙."
    fi
  else
    echo "bye bye 😙."
  fi
else
  echo "bye bye 😙."
fi
