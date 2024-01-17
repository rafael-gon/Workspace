#!/bin/bash

USER_HOME=$(eval echo ~$(whoami))

sudo -v

while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

cd /tmp
sudo -n pacman -S git

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

cd $USER_HOME

# - - - - - Geral - - - - - #
yay -Syyuu

yay -S base-devel unzip unrar exa bat wget curl docker noto-fonts noto-fonts-cjk \
       noto-fonts-emoji noto-fonts-extra inter-font ttf-roboto ttf-ubuntu-font-family \
       bluez bluez-libs bluez-plugins bluez-utils flatpak asdf-vm nerd-fonts-git \
       qbittorrent inkscape discord prismlauncher dropbox vlc visual-studio-code-bin \
       visual-studio-code-insiders-bin insomnia nodejs-nativefier zsh starship \
       alacritty gnome-keyring wayland xorg-xwayland --noconfirm

sudo -n systemctl enable bluetooth

sudo -n chown -R $(whoami) /opt/visual-studio-code
sudo -n chown -R $(whoami) /opt/visual-studio-code-insiders

flatpak install flathub com.stremio.Stremio -y

xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-bittorrent
xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-torrent
xdg-mime default org.qbittorrent.qBittorrent.desktop x-scheme-handler/magnet

sudo -n chown -R $(whoami) /opt/visual-studio-code

sudo -n chown -R $(whoami) /opt/visual-studio-code-insiders

mkdir -pv $USER_HOME/.local/share/nativefier

sudo -n chown -R $(whoami) "$USER_HOME/.local/share/nativefier"

cd "$USER_HOME/.local/share/nativefier"

nativefier --name "WhatsApp" 'web.whatsapp.com'
nativefier --name "Notion" 'https://www.notion.so/'

cd $USER_HOME

echo "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=$USER_HOME/.local/share/nativefier/WhatsApp-linux-x64/WhatsApp
Name=WhatsApp
Comment=Simple, secure, reliable messaging and calling
Icon=whatsapp" >> "$USER_HOME/.local/share/applications/whatsapp.desktop"

sudo -n chmod +x "$USER_HOME/.local/share/applications/whatsapp.desktop"

echo "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=$USER_HOME/.local/share/nativefier/notion-linux-x64/notion
Name=Notion
Comment=Connected workspace where better, faster work happens
Icon=notion" >> "$USER_HOME/.local/share/applications/notion.desktop"

sudo -n chmod +x "$USER_HOME/.local/share/applications/notion.desktop"

displayServer=$(whiptail --title "Rafael Script" --menu "What desktop environment do you like to use?" 15 60 3 "1" "Gnome" "2" "Sway" "3" "Plasma" 3>&1 1>&2 2>&3)

displayServerExit=$?

if [ $displayServerExit = 0 ]; then
  if [ $displayServer = 1 ]; then
    # "---------- ---------- ---------- Gnome ---------- ---------- ----------" #
    yay -S gnome-shell gnome-shell-extensions gdm gnome-backgrounds gnome-calculator gnome-calendar \
          gnome-characters gnome-color-manager gnome-control-center gnome-font-viewer gnome-menus \
          gnome-session gnome-settings-daemon gnome-software gnome-system-monitor gnome-text-editor \
          loupe nautilus snapshot sushi xdg-desktop-portal-gnome xdg-user-dirs-gtk gnome-tweaks file-roller \
          evince gvfs gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb  --noconfirm

    cd /usr/share/applications
    xdg-mime default nautilus.desktop inode/directory

    sudo -n systemctl enable gdm

    kill "$!" 2>/dev/null

  elif [ $displayServer = 2 ]; then
    # "---------- ---------- ---------- Sway ---------- ---------- ----------" #
    yay -S swayfx-git swaylock-effects thunar thunar thunar-archive-plugin thunar-media-tags-plugin \
          thunar-shares-plugin thunar-volman tumbler-extra-thumbnailers tumbler swaybg swaync-git \
          pipewire wireplumber viewnior mousepad grim slurp xarchiver xclip wl-clipboard light brightnessctl \
          pamixer avizo ulauncher ly waybar --noconfirm

    cd /usr/share/applications
    xdg-mime default thunar.desktop inode/directory

    sudo -n timedatectl set-ntp true

    sudo -n systemctl enable ly

    kill "$!" 2>/dev/null

  elif [ $displayServer = 3 ]; then
    # "---------- ---------- ---------- Plasma ---------- ---------- ----------" #
    yay -S plasma-desktop bluedevil discover dolphin latte-dock sddm okular ark spectacle \
           gwenview kdeconnect flatpak-kcm kde-gtk-config  kdeplasma-addons kinfocenter \
           kpipewire kscreen kscreenlocker ksystemstats kwin plasma-nm plasma-pa plasma-sdk \
           plasma-systemmonitor plasma-workspace sddm-kcm systemsettings xdg-desktop-portal-kde \
           libdbusmenu-glib packagekit-qt5 --noconfirm

    sudo -n systemctl enable sddm

    kill "$!" 2>/dev/null

  else
    echo "bye bye 😙."
  fi
else
  echo "bye bye 😙."
fi
