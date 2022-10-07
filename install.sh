#!/bin/bash

#Installing Packages
sudo apt update -y && sudo apt upgrade -y

sudo apt install -y stow

stow bin
stow bumblebee-status
stow dunst
stow i3
stow kitty
stow rofi
stow starship
stow tmux
stow zsh

sudo apt install -y xorg
sudo apt install -y curl
sudo apt install -y tmux
sudo apt install -y python3-pip
sudo apt install -y bat
sudo apt install -y python3-tk
sudo apt install -y thunar
sudo apt install -y xfce4-settings
sudo apt install -y ranger
sudo apt install -y lxappearance
sudo apt install -y network-manager-gnome
sudo apt install -y kitty
sudo apt install -y zsh
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa
sudo apt install -y neofetch htop
sudo apt install -y exa
sudo apt install -y meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev i3status
sudo apt install -y dmenu rofi dunst libnotify-bin picom unzip
sudo apt install -y vim
sudo apt install -y feh #feh --bg-fill /path/to/directory
sudo apt install -y fonts-font-awesome fonts-powerline fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus fonts-cascadia-code
sudo apt install -y aptitude


#Install zoxide
cd
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

#Install i3-gaps
cd
cd Downloads
git clone https://github.com/Airblader/i3 i3-gaps
cd i3-gaps
mkdir -p build && cd build
meson --prefix /usr/local
ninja
sudo ninja install

#Install bumblebee-status bar
pip install --user bumblebee-status

#Install starship ~
cd
curl -sS https://starship.rs/install.sh | sh

#Install fzf
cd
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#Install sddm
sudo apt install -y sddm
sudo systemctl enable sddm

# XSessions and i3.desktop
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=i3
Comment=Dynamic window manager
Exec=i3
Icon=i3
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/i3.desktop;rm ./temp

#############################################
# End of script for default config

sudo apt autoremove

#Install Oh-my-zsh in ~
cd
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

cd
mkdir ~/repos
mkdir ~/work
mkdir ~/personal
mkdir ~/work/projects
mkdir ~/personal/projects

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
