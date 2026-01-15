# Store history in one file
export HISTFILE=~/.bash_history
export HISTSIZE=100000
export HISTFILESIZE=100000

# Append instantly (no overwrite)
shopt -s histappend

# Write and reload every time a command finishes
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
