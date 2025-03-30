export ZSH="$HOME/.oh-my-zsh"
 CASE_SENSITIVE="true"
 HYPHEN_INSENSITIVE="true"
 zstyle ':omz:update' mode reminder  # just remind me to update when it's time
 zstyle ':omz:update' frequency 13
 DISABLE_MAGIC_FUNCTIONS="true"
 COMPLETION_WAITING_DOTS="true"
 HIST_STAMPS="mm/dd/yyyy"
plugins=(git)
source $ZSH/oh-my-zsh.sh
#for pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
export PATH="$HOME/.pyenv/shims:$PATH"
# for plagiarism detection project.
alias activate_plagiarism="source ~/Projects/plagiarism-detection/venv/bin/activate"
# Automatically start tmux if not already inside a session
#if [[ -z "$TMUX" ]]; then
#  exec tmux
#fi
eval "$(starship init zsh)"

# For default terminal
export TERMINAL=kitty
