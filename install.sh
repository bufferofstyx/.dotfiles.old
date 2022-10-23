#!/bin/bash
#Installing Packages
sudo apt update -y && sudo apt upgrade -y

sudo apt install -y stow

stow lvim
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
sudo apt install -y feh
sudo apt install -y fonts-font-awesome fonts-powerline fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus fonts-cascadia-code
sudo apt install -y aptitude
sudo apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

#Install lvim
cd
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

#Install neovim
cd
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

#Install Font
cd /usr/share/fonts
sudo mkdir ComicCode
cd ComicCode
sudo wget https://dtinth.github.io/comic-mono-font/ComicMono.ttf

#Install zoxide
cd
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

#Install burpsuite
cd
cd Downloads
wget https://portswigger.net/burp/releases/startdownload?product=community&version=2022.8.5&type=Linux -o burpsuiteinstall.sh
bash ./burpsuiteinstall.sh

#Install poetry
cd 
cd Downloads
curl -sSL https://install.python-poetry.org | python3 -
poetry self update

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

#install docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce

#Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/2.12.2/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose

#Install glow
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow

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

#Installing poetry tab completion
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry

git clone https://github.com/wfxr/forgit.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/forgit
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
