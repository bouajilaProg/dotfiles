#!/bin/bash

# main aliases
alias cls="clear"
alias ls="eza --icons -a --git -s type"
alias ll="eza -l --icons --git -a -s type"
alias lld="eza -l --icons --git -a -s date"
alias cat="bat"
alias grep="grep --color=auto"
alias fcd='cd "$(dirname "$(fzf)")"'
alias cd='z' # careful: overrides builtin cd

# utils aliases
alias clip="xclip -selection clipboard"
alias get-ip="ip -4 addr show | grep inet | grep wlan | cut -d/ -f1"
alias untar="tar -xvf"
alias untargz="tar -xzvf"
alias tarComp="tar -czvf"
alias targzComp="tar -czvf"
alias update-system="sudo pacman -Syu --noconfirm && yay -Syu --noconfirm"
alias reboot-firm="sudo systemctl reboot --firmware-setup"
alias conda-init='source ~/miniconda3/etc/profile.d/conda.sh'

# nvim
alias fnv='nvim "$(fzf)"'
alias nvd="nvim ."
alias nv="nvim"
alias v="nvim"
alias vi="nvim"
alias nano="nvim"

# tmux aliases
alias tmux="TERM=xterm-kitty; tmux"
alias tm=" TERM=xterm-kitty; tmux"
alias ta="tmux attach -t"
alias tn="tmux new-session -s "
alias rn="tmux rename "

# script aliases
alias reboot="~/bouajilascripts/utils/reboot.sh"
alias sakr="~/bouajilascripts/utils/sakr.sh"
alias calc="/home/bouajila/bouajilascripts/utils/calc.sh"
alias wifi-share="/home/bouajila/bouajilascripts/utils/wifi-share/wifi-share.sh"

# fun aliases
alias aquarium="asciiquarium"
alias cmatrix="cmatrix -b"

# apps allias
alias postgres="sudo su - postgres "
alias vm-manager="/usr/bin/python3 /usr/bin/virt-manager"
