__conda_setup="$('/home/bouajila/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/home/bouajila/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/home/bouajila/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="/home/bouajila/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup

# pnpm
export PNPM_HOME="/home/bouajila/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bouajila
export PATH=/home/bouajila/scripts/bin/:$PATH
export PATH=/home/bouajila/Applications/bin/:$PATH
# end bouajila
