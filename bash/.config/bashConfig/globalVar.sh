# Apps exports
export BROWSER=/usr/local/bin/zen-browser
export EDITOR=/usr/bin/nvim
export FILEEXPLORER=/usr/bin/nemo

# folder path exports
export XDG_CONFIG_HOME="$HOME/.config"

# exports for apps
export DOCKER_CONTENT_TRUST=1

# scripts variables
export caffeine=0

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
