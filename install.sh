#!/bin/bash
whiptail --title "!!! WARNING !!!" --msgbox "To use this script you will need git and yay in your computer." 10 60

# - - - - - Geral - - - - - #
yay -Syyuu

yay -S base-devel unzip unrar exa bat wget curl docker noto-fonts noto-fonts-cjk \
       noto-fonts-emoji noto-fonts-extra bluez bluez-libs bluez-plugins bluez-utils \
       flatpak asdf-vm nerd-fonts-git qbittorrent inkscape discord prismlauncher \
       dropbox vlc visual-studio-code-bin insomnia nodejs-nativefier zsh starship \
       alacritty gnome- wayland xorg-xwayland --noconfirm

sudo systemctl enable bluetooth

flatpak install flathub com.stremio.Stremio -y

xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-bittorrent
xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-torrent
xdg-mime default org.qbittorrent.qBittorrent.desktop x-scheme-handler/magnet

mkdir -pv ~/.local/share/nativefier

cd ~/.local/share/nativefier

nativefier --name "WhatsApp" 'web.whatsapp.com'
nativefier --name "Notion" 'https://www.notion.so/'

cd

echo "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/home/rafael/.local/share/nativefier/WhatsApp-linux-x64/WhatsApp
Name=WhatsApp
Comment=Simple, secure, reliable messaging and calling
Icon=whatsapp" >> ~/.local/share/applications/whatsapp.desktop

sudo chmod +x ~/.local/share/applications/whatsapp.desktop

echo "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/home/rafael/.local/share/nativefier/notion-linux-x64/notion
Name=Notion
Comment=Connected workspace where better, faster work happens
Icon=notion" >> ~/.local/share/applications/notion.desktop

sudo chmod +x ~/.local/share/applications/notion.desktop

displayServer=$(whiptail --title "Rafael Script" --menu "What desktop environment do you like to use?" 15 60 3 "1" "Gnome" "2" "Plasma" "3" "Sway" 3>&1 1>&2 2>&3)

displayServerExit=$?

if [ $displayServerExit = 0 ]; then
  if [ $displayServer = 1 ]; then
    # "---------- ---------- ---------- Gnome ---------- ---------- ----------" #
    yay -S gnome-shell gnome-shell-extensions gdm gnome-backgrounds gnome-calculator gnome-calendar \
          gnome-characters gnome-color-manager gnome-control-center gnome-font-viewer gnome-menus \
          gnome-session gnome-settings-daemon gnome-software gnome-system-monitor gnome-text-editor \
          loupe nautilus snapshot sushi xdg-desktop-portal-gnome xdg-user-dirs-gtk gnome-tweaks file-roller \
          evince gvfs gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb  --noconfirm

    xdg-mime query default inode/directory nautilus.desktop

    sudo systemctl enable gdm

  elif [ $displayServer = 2 ]; then
    # "---------- ---------- ---------- Plasma ---------- ---------- ----------" #
    yay -S swayfx-git swaylock-effects thunar thunar thunar-archive-plugin thunar-media-tags-plugin \
          thunar-shares-plugin thunar-volman tumbler-extra-thumbnailers tumbler swaybg swaync-git \
          pipewire wireplumber viewnior mousepad grim slurp xclip wl-clipboard light brightnessctl \
          pamixer avizo ulauncher ly waybar --noconfirm

    xdg-mime query default inode/directory thunar.desktop

    sudo systemctl enable ly

  elif [ $displayServer = 3 ]; then
    # "---------- ---------- ---------- Sway ---------- ---------- ----------" #
    yay -S plasma-desktop bluedevil discover dolphin latte-dock sddm okular ark spectacle gwenview \
          kdeconnect flatpak-kcm kactivitymanagerd kde-cli-tools kde-gtk-config kdecoration kdeplasma-addons \
          kgamma khotkeys kinfocenter kmenuedit kpipewire kscreen kscreenlocker ksystemstats kwin kwrited \
          layer-shell-qt libkscreen libksysguard milou plasma-browser-integration plasma-integration plasma-nm \
          plasma-pa plasma-sdk plasma-systemmonitor plasma-thunderbolt plasma-vault plasma-workspace \
          plasma-workspace-wallpapers plymouth-kcm polkit-kde-agent powerdevil sddm-kcm systemsettings \
          xdg-desktop-portal-kde libdbusmenu-glib packagekit-qt5 --noconfirm

    sudo systemctl enable sddm

  else
    echo "bye bye 😙."
  fi
else
  echo "bye bye 😙."
fi
