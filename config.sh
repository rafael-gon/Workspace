mkdir -pv ~/.config/alacritty

mkdir -pv ~/.config/waybar

mkdir -pv ~/.config/sway
mkdir -pv ~/.config/sway/config.d

mkdir -pv ~/.config/neofetch

echo '# ---------- EXPORT ---------- #
  export PATH=$HOME/bin:/usr/local/bin:$PATH

  export PATH=$HOME/.cargo.bin:$HOME/.local/bin:$PATH

  export ZSH="$HOME/.oh-my-zsh"

  . /opt/asdf-vm/asdf.sh

  eval "$(starship init zsh)"

  # ---------- PLUGINS ---------- #
  plugins=(git)

  source $ZSH/oh-my-zsh.sh

  # ---------- ALIAS ---------- #
  alias ls="exa --icons"

  alias cat="bat --style=auto"

  alias update="flatpak update -y && yay -Syyuu --noconfirm"

  alias ips="ip -c a"

  alias ipup="ip -c -br a"

  alias size="du -sh * | sort -hr"

  alias mkdir="mkdir -pv"

  alias off="shutdown now"

  alias rm="rm -rf"

  alias install="yay -S"

  alias remove="yay -R"

  alias purge="yay -Rns"

  bindkey "^H" backward-kill-word
  
  bindkey "5~" kill-word

  # ---------- ZINIT ---------- #
  if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
      print -P "%F{33} %F{34}Installation successful.%f%b" || \
      print -P "%F{160} The clone has failed.%f%b"
  fi

  source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-completions' >> ~/.zshrc


echo 'background_opacity: 0.7
window:
  opacity: 0.7
  padding:
    x: 10
    y: 10
font:
  size: 10
  normal:
    family: "Fira Code"
  bold:
    family: "Fira Code"
  italic:
    family: "Fira Code"
cursor:
  style:
    shape: Beam
    blinking: never
  unfocused_hollow: true
  thickness: 0.15
colors:
  primary:
    background: "#24273A" 
    foreground: "#CAD3F5" 
    dim_foreground: "#CAD3F5" 
    bright_foreground: "#CAD3F5" 
  cursor:
    text: "#24273A" 
    cursor: "#F4DBD6" 
  vi_mode_cursor:
    text: "#24273A" 
    cursor: "#B7BDF8" 
  search:
    matches:
      foreground: "#24273A" 
      background: "#A5ADCB" 
    focused_match:
      foreground: "#24273A" 
      background: "#A6DA95" 
    footer_bar:
      foreground: "#24273A" 
      background: "#A5ADCB" 
  hints:
    start:
      foreground: "#24273A" 
      background: "#EED49F" 
    end:
      foreground: "#24273A" 
      background: "#A5ADCB" 
  selection:
    text: "#24273A" 
    background: "#F4DBD6" 
  normal:
    black: "#494D64" 
    red: "#ED8796" 
    green: "#A6DA95" 
    yellow: "#EED49F" 
    blue: "#8AADF4" 
    magenta: "#F5BDE6" 
    cyan: "#8BD5CA" 
    white: "#B8C0E0" 
  bright:
    black: "#5B6078" 
    red: "#ED8796" 
    green: "#A6DA95" 
    yellow: "#EED49F" 
    blue: "#8AADF4" 
    magenta: "#F5BDE6" 
    cyan: "#8BD5CA" 
    white: "#A5ADCB" 
  dim:
    black: "#494D64" 
    red: "#ED8796" 
    green: "#A6DA95" 
    yellow: "#EED49F" 
    blue: "#8AADF4" 
    magenta: "#F5BDE6" 
    cyan: "#8BD5CA" 
    white: "#B8C0E0" 
  indexed_colors:
    - { index: 16, color: "#F5A97F" }
    - { index: 17, color: "#F4DBD6" }' >> ~/.config/alacritty/alacritty.yml


echo '{
    "layer": "top",
    "position": "top",
    "height": 24,
    "modules-left": ["sway/workspaces"],
    "modules-center": [ "clock"],
    "modules-right": ["tray", "pulseaudio", "bluetooth", "network", "battery"],
    "sway/workspaces": {
        "disable-scroll": true,
        "disable-markup" : false,
        "all-outputs": false,
        "format": "  {icon}  ",
        "format-icons": {
            "1": "一",
            "2": "二",
            "3": "三",
            "4": "四",
            "5": "五",
            "6": "六",
            "7": "七",
            "8": "八",
            "9": "九",
            "10": "十",
            "11": "一",
            "12": "二",
            "13": "三",
            "14": "四",
            "15": "五",
            "16": "六",
            "17": "七",
            "18": "八",
            "19": "九",
            "20": "十"
        }
    },
    "tray": {
        "icon-size": 14,
        "spacing": 10
    },
    "clock": {
        "format": "{:%a, %b %d | %H:%m}",
        "tooltip-format": "<big>{:%Y %B \t   week: %V }</big>\n<tt>{calendar}</tt>"
    },
    "battery": {
        "states": {
            "good": 95,
            "warning": 20,
            "critical": 7
        },
        "format": "{icon}",
        "tooltip-format": "{capacity}%",
        "format-icons": ["", "", "", "", ""]
    },
    "network": {
        "format-wifi": "",
        "format-ethernet": "",
        "format-disconnected": "⚠",
        "interval" : 7,
        "tooltip": false,
        "on-click": "alacritty --class='\''float'\'' -e nmtui"
    },
        "bluetooth": {
            "format": "{icon}",
            "format-icons": {
            "enabled": "󰂯",
            "disabled": "󰂲"
        },
        "on-click": "alacritty --class='\''float'\'' -e bluetuith"
    },
    "pulseaudio": {
        "format": "{icon}",
        "tooltip-format": "{volume}%",
        "format-muted": "",
        "format-icons": {
            "headphones": "",
            "handsfree": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", ""]
        },
        "on-click": "pavucontrol"
    }
}' >> ~/.config/waybar/config

echo '* {
  border: none;
  border-radius: 0;
  font-family: Roboto,"Font Awesome 5", "SFNS Display",  Helvetica, Arial, sans-serif;
  font-size: 10px;
  min-height: 0;
}

window#waybar {
  background: #181926;
  color: #cad3f5;
}

window#waybar.hidden {
  opacity: 0.0;
}

#workspaces button {
  padding: 0 5px;
  color: #5b6078;
  font-weight: bold;
  border-bottom: 2px solid transparent;
}

#workspaces button.focused {
  color: #c6a0f6;
  border-bottom: 2px solid #c6a0f6;
}

#workspaces button.urgent {
  background-color: #ed8796;
}

#battery,#network, #pulseaudio, #tray, #bluetooth {
  padding: 0 10px;
  margin: 0 5px;
  font-size: 24px;
  color: #cad3f5;
}

tooltip label {
  padding: 5px 10px;
  color: #cad3f5;
  font-size: 16px;
}

tooltip {
  background: #181926;
  border: 3px solid #b4befe;
}

#clock {
  font-size: 14px;
}

#battery.charging {
  color: #a6da95;
}

@keyframes blink {
  to {
      background-color: #cad3f5;
      color: #181926;
  }
}

#battery.critical:not(.charging) {
  background: #ed8796;
  color: #cad3f5;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

#network.disconnected {
  color: #ed8796;
}

#pulseaudio.muted {
  color: #ed8796;
}' >> ~/.config/waybar/style.css



echo '#-#-#-#-#-#-#-#-#-# Set #-#-#-#-#-#-#-#-#-#
set $mod Mod4
set $alt Mod1

set $hdmi HDMI-A-1
set $edp eDP-1

set $term WINIT_UNIX_BACKEND=x11 alacritty

set $menu ulauncher

set $lock swaylock \
        --screenshots \
        --clock \
        --indicator \
        --indicator-radius 300 \
        --indicator-thickness 7 \
        --effect-blur 7x5 \
        --effect-vignette 0.5:0.5 \
        --ring-color bb00cc00 \
        --key-hl-color 88003300 \
        --line-color 00000000 \
        --inside-color 00000000 \
        --separator-color 00000000 \
        --inside-wrong-color 00000000 \
        --line-wrong-color 00000000 \
        --ring-wrong-color 00000000 \
        --text-wrong-color ff0000 \
         --inside-ver-color 00000000 \
         --line-ver-color 00000000 \
         --ring-ver-color 00000000 \
         --text-ver-color 00ff00
#-#-#-#-#-#-#-#-#-# General #-#-#-#-#-#-#-#-#-#
font pango:monospace 8

floating_modifier $mod normal

include ~/.config/sway/config.d/*
#-#-#-#-#-#-#-#-#-# Startup Exec #-#-#-#-#-#-#-#-#-#
exec waybar

exec avizo-service

#-#-#-#-#-#-#-#-#-# Output #-#-#-#-#-#-#-#-#-#
output * bg ~/.local/share/Wallpapers/Wallpaper.png fill

output HDMI-A-1 resolution 2560x1080 position 0,0
output eDP-1 resolution 1920x1080 position 2560,0

#-#-#-#-#-#-#-#-#-# Input #-#-#-#-#-#-#-#-#-#
input "1267:12522:ELAN0B00:00_04F3:30EA_Touchpad" {
  dwt enabled
  tap enabled
  natural_scroll enabled
  middle_emulation enabled
}

input "1452:591:Keychron_Keychron_K3" {
 xkb_layout "us"
 xkb_variant "alt-intl"
}

input "1:1:AT_Translated_Set_2_keyboard" {
 xkb_layout "br"
 xkb_variant "abnt2"
}


#-#-#-#-#-#-#-#-#-# For Windows #-#-#-#-#-#-#-#-#-#
for_window [class="^.*"] border pixel 3

for_window [app_id="ulauncher"] border none; blur none

for_window [app_id="pavucontrol"] floating enable; move position center

for_window [app_id="float"] floating enable; move position center

#-#-#-#-#-#-#-#-#-# Gaps #-#-#-#-#-#-#-#-#-#
corner_radius 10
blur enable

smart_borders on
smart_gaps off

gaps outer 0
gaps inner 10' >> ~/.config/sway/config

echo 'exec systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP
exec hash dbus-update-activation-environment 2>/dev/null && \
  dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP' >> ~/.config/sway/config.d/50-systemd-user.conf

echo '# -----  FN keys ----- #
bindsym XF86AudioRaiseVolume exec volumectl -u up

bindsym XF86AudioLowerVolume exec volumectl -u down

bindsym XF86AudioMute exec volumectl toggle-mute

bindsym $mod+F10 exec volumectl -m toggle-mute

bindsym XF86MonBrightnessUp exec lightctl up

bindsym XF86MonBrightnessDown exec lightctl down

# -----  Print ----- #
#print selected area
bindsym Print exec grim -g "$(slurp)" - | xclip -selection clipboard -t image/png
#print full screen
bindsym Shift+Print exec grim - | xclip -selection clipboard -t image/png

# -----  System ----- #
#restart Sway
bindsym $mod+Shift+c reload

# Start a terminal
bindsym $mod+Return exec $term

# Start your launcher
bindsym $mod+Space exec $menu

# Lock screen
bindsym $mod+l exec $lock

# Kill focused window
bindsym $mod+q kill

#split window direction to horizontal
bindsym $mod+b splith

#split window direction to vertical
bindsym $mod+v splitv

#change screen to full screen
bindsym $mod+f fullscreen

#change screen to floating mode
bindsym $mod+Shift+space floating toggle

#move between windows
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

#move windows
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right' >> ~/.config/sway/config.d/bindym.conf

echo 'set $cl_high #c6a0f6
set $cl_indi #5b6078
set $cl_back #181926
set $cl_fore #cad3f5
set $cl_urge #ed8796

# Colors                border   bg       text     indi     childborder
client.focused          $cl_high $cl_high $cl_fore $cl_indi $cl_high
client.focused_inactive $cl_back $cl_back $cl_fore $cl_back $cl_back
client.unfocused        $cl_back $cl_back $cl_fore $cl_back $cl_back
client.urgent           $cl_urge $cl_urge $cl_fore $cl_urge $cl_urge' >> ~/.config/sway/config.d/theme.conf

echo 'workspace "1" output $hdmi
workspace "2" output $hdmi
workspace "3" output $hdmi
workspace "4" output $hdmi
workspace "5" output $hdmi
workspace "6" output $hdmi
workspace "7" output $hdmi
workspace "8" output $hdmi
workspace "9" output $hdmi
workspace "10" output $hdmi
workspace "11" output $edp
workspace "12" output $edp
workspace "13" output $edp
workspace "14" output $edp
workspace "15" output $edp
workspace "16" output $edp
workspace "17" output $edp
workspace "18" output $edp
workspace "19" output $edp
workspace "20" output $edp

set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"
set $ws11 "11"
set $ws12 "12"
set $ws13 "13"
set $ws14 "14"
set $ws15 "15"
set $ws16 "16"
set $ws17 "17"
set $ws18 "18"
set $ws19 "19"
set $ws20 "20"

# -----  Workspaces ----- #
#mode between workspaces
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10
bindsym $alt+1 workspace $ws11
bindsym $alt+2 workspace $ws12
bindsym $alt+3 workspace $ws13
bindsym $alt+4 workspace $ws14
bindsym $alt+5 workspace $ws15
bindsym $alt+6 workspace $ws16
bindsym $alt+7 workspace $ws17
bindsym $alt+8 workspace $ws18
bindsym $alt+9 workspace $ws19
bindsym $alt+0 workspace $ws20

#move window between workspaces
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10
bindsym $alt+Shift+1 move container to workspace $ws11
bindsym $alt+Shift+2 move container to workspace $ws12
bindsym $alt+Shift+3 move container to workspace $ws13
bindsym $alt+Shift+4 move container to workspace $ws14
bindsym $alt+Shift+5 move container to workspace $ws15
bindsym $alt+Shift+6 move container to workspace $ws16
bindsym $alt+Shift+7 move container to workspace $ws17
bindsym $alt+Shift+8 move container to workspace $ws18
bindsym $alt+Shift+9 move container to workspace $ws19
bindsym $alt+Shift+0 move container to workspace $ws20

#move window between workspaces and go there
bindsym $mod+Ctrl+1 move container to workspace $ws1 ; workspace $ws1
bindsym $mod+Ctrl+2 move container to workspace $ws2 ; workspace $ws2
bindsym $mod+Ctrl+3 move container to workspace $ws3 ; workspace $ws3
bindsym $mod+Ctrl+4 move container to workspace $ws4 ; workspace $ws4
bindsym $mod+Ctrl+5 move container to workspace $ws5 ; workspace $ws5
bindsym $mod+Ctrl+6 move container to workspace $ws6 ; workspace $ws6
bindsym $mod+Ctrl+7 move container to workspace $ws7 ; workspace $ws7
bindsym $mod+Ctrl+8 move container to workspace $ws8 ; workspace $ws8
bindsym $mod+Ctrl+9 move container to workspace $ws9 ; workspace $ws9
bindsym $mod+Ctrl+0 move container to workspace $ws10 ; workspace $ws10
bindsym $alt+Ctrl+1 move container to workspace $ws11 ; workspace $ws11
bindsym $alt+Ctrl+2 move container to workspace $ws12 ; workspace $ws12
bindsym $alt+Ctrl+3 move container to workspace $ws13 ; workspace $ws13
bindsym $alt+Ctrl+4 move container to workspace $ws14 ; workspace $ws14
bindsym $alt+Ctrl+5 move container to workspace $ws15 ; workspace $ws15
bindsym $alt+Ctrl+6 move container to workspace $ws16 ; workspace $ws16
bindsym $alt+Ctrl+7 move container to workspace $ws17 ; workspace $ws17
bindsym $alt+Ctrl+8 move container to workspace $ws18 ; workspace $ws18
bindsym $alt+Ctrl+9 move container to workspace $ws19 ; workspace $ws19
bindsym $alt+Ctrl+0 move container to workspace $ws20 ; workspace $ws20' >> ~/.config/sway/config.d/workspaces.conf

echo 'print_info() {
    info "OS" distro
    info "Kernel" kernel
    info "Shell" shell
    info "Windows Manager" wm
    info "Terminal" term
    info "CPU" cpu 
    info "Memory" memory
}
kernel_shorthand="on"
distro_shorthand="on"
os_arch="off"
memory_percent="off"
memory_unit="gib"
shell_path="off"
shell_version="off"
cpu_brand="on"
cpu_speed="off"
colors=(5 5 5 5 7 7)
bold="on"
separator=":"
ascii_distro="arch_small"
ascii_colors=(12 12 12 12 12 12)
ascii_bold="on"
gap=3' >> ~/.config/neofetch/config.conf