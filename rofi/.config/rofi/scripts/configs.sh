#!/usr/bin/env bash
EDITOR="kitty -e nano"

declare -A config_list
config_list[tmux]="$HOME/.tmux.conf"
config_list[zsh-profile]="$HOME/.config/zsh/.zsh-profile"
config_list[zsh-aliases]="$HOME/.config/zsh/zsh-aliases"
config_list[ohmyzh]="$HOME/.oh-my-zsh"
config_list[bashrc]="$HOME/.bashrc"
config_list[zshrc]="$HOME/.config/zsh/.zshrc"
config_list[install.sh]="$HOME/.dotfiles/install.sh"
config_list[i3]="$HOME/.config/i3/config"
config_list[starship]="$HOME/.config/starship.toml"
config_list[kitty]="$HOME/.config/kitty/kitty.conf"
config_list[confedit]="$HOME/.config/rofi/scripts/configs.sh"
config_list[quit]="quit"

choice=$(printf '%s\n' "${!config_list[@]}" | rofi -dmenu -i 20 -p 'Editing Config')
echo $choice
if [ "!$choice" ]; then
	cfg=$(printf '%s\n' "${config_list["${choice}"]}")
	$EDITOR "$cfg"
else
	echo "Program terminated." && exit 0
fi
