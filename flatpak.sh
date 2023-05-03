flatpak install flathub com.spotify.Client \
                flathub com.stremio.Stremio \
                flathub rest.insomnia.Insomnia \
                flathub org.DolphinEmu.dolphin-emu \
                flathub org.citra_emu.citra \
                flathub org.ppsspp.PPSSPP \
                flathub org.duckstation.DuckStation \
                flathub com.valvesoftware.Steam \
                flathub net.kuribo64.melonDS \
                flathub org.yuzu_emu.yuzu \
                flathub org.prismlauncher.PrismLauncher \
                flathub net.pcsx2.PCSX2 \
                flathub com.discordapp.Discord \
                flathub org.qbittorrent.qBittorrent \
                flathub com.dropbox.Client \
                flathub com.getmailspring.Mailspring \
                flathub org.gnome.Boxes -y

xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-bittorrent
xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-torrent
xdg-mime default org.qbittorrent.qBittorrent.desktop x-scheme-handler/magnet