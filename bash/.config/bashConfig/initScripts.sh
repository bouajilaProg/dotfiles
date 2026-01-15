### Deno
# shellcheck disable=SC1091
[ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"
# shellcheck disable=SC1091
[ -f "$HOME/.local/share/bash-completion/completions/deno.bash" ] &&
  source "$HOME/.local/share/bash-completion/completions/deno.bash"

### Starship
eval "$(starship init bash)"

### Rust / Cargo
# shellcheck disable=SC1091
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

### Terminal type
if [[ -n "${KITTY_PID:-}" ]]; then
  export TERM="xterm-kitty"
else
  export TERM="xterm-256color"
fi

### NVM
export NVM_DIR="$HOME/.config/nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

### Zoxide
eval "$(zoxide init bash)"

# fzf key bindings and completion
[ -f "/usr/share/fzf/key-bindings.bash" ] && source /usr/share/fzf/key-bindings.bash

# Fastfetch
clear
echo
fastfetch
