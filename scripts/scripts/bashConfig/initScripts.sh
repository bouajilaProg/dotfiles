# deno env start
. "/home/bouajila/.deno/env"
source /home/bouajila/.local/share/bash-completion/completions/deno.bash

eval "$(starship init bash)"

. "$HOME/.cargo/env"

# choose term type
if [[ -n "$KITTY_PID" ]]; then
  export TERM="xterm-kitty"
else
  export TERM="xterm-256color"
fi

# set up nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# set up zoxide
eval "$(zoxide init bash)"
