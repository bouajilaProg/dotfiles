#!/bin/bash

# main aliases
alias cls="clear"
alias ls="eza --icons -a --git -s type"
alias ll="eza -l --icons --git -a -s type"
alias lld="eza -l --icons --git -a -s date"
alias cat="bat"
alias grep="grep --color=auto"
alias fcd='cd "$(dirname "$(fzf)")"'
alias cd='z'

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
alias NM-restart="sudo systemctl restart NetworkManager.service"

# nvim
alias fnv='nvim "$(fzf)"'
alias nvd="nvim ."
alias nv="nvim"
alias v="nvim"
alias vi="nvim"
alias nano="nvim"

# tmux aliases
alias tmux="TERM=xterm-kitty tmux"
alias tm="TERM=xterm-kitty tmux"
alias ta="tmux attach -t"
alias tn="tmux new-session -s"
alias rn="tmux rename-session"

# fun aliases
alias aquarium="asciiquarium"
alias cmatrix="cmatrix -b"

# apps aliases
alias postgres="sudo -u postgres -i"
alias vm-manager="python3 /usr/bin/virt-manager"

# other
alias kb-setup="sudo asusctl aura static -c DEF3FF"
