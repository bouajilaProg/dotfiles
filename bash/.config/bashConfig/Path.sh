# pnpm
export PNPM_HOME="/home/bouajila/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bouajila
export PATH=/home/bouajila/programs/bin/:$PATH
export PATH=/home/bouajila/Applications/bin/:$PATH
export PATH=/home/bouajila/.programs/bin/:$PATH
# end bouajila

# opencode
export PATH=/home/bouajila/.opencode/bin:$PATH
