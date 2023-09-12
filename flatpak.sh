flatpak install flathub com.dropbox.Client /
                flathub com.obsproject.Studio /
                flathub com.stremio.Stremio /
                flathub org.DolphinEmu.dolphin-emu /
                flathub org.ppsspp.PPSSPP /
                flathub org.duckstation.DuckStation /
                flathub com.valvesoftware.Steam /
                flathub org.citra_emu.citra /
                flathub net.kuribo64.melonDS /
                flathub com.heroicgameslauncher.hgl /
                flathub org.yuzu_emu.yuzu /
                flathub org.prismlauncher.PrismLauncher /
                flathub net.pcsx2.PCSX2 /
                flathub com.discordapp.Discord /
                flathub org.qbittorrent.qBittorrent -y

xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-bittorrent
xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-torrent
xdg-mime default org.qbittorrent.qBittorrent.desktop x-scheme-handler/magnet
