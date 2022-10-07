#!/usr/bin/env bash
EDITOR="kitty -e nano"
DOTFILES="$HOME/.dotfiles"

declare -A config_list
config_list[tmux]="$DOTFILES/tmux/.tmux.conf"
config_list[zsh-profile]="$DOTFILES/zsh/.zsh-profile"
config_list[zsh-aliases]="$DOTFILES/zsh/.zsh-aliases"
config_list[bashrc]="$HOME/.bashrc"
config_list[zshrc]="$DOTFILES/zsh/.zshrc"
config_list[install.sh]="$DOTFILES/install.sh"
config_list[i3]="$DOTFILES/i3/.config/i3/config"
config_list[starship]="$DOTFILES/starship/.config/starship.toml"
config_list[kitty]="$DOTFILES/kitty/.config/kitty/kitty.conf"
config_list[confedit]="$DOTFILES/rofi/.config/rofi/scripts/configs.sh"
config_list[quit]="quit"

choice=$(printf '%s\n' "${!config_list[@]}" | rofi -dmenu -i 20 -p 'Editing Config')
echo $choice
if [ "!$choice" ]; then
	cfg=$(printf '%s\n' "${config_list["${choice}"]}")
	$EDITOR "$cfg"
else
	echo "Program terminated." && exit 0
fi
