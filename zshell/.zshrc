export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="xiong-chiamiov-plus"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' frequency 13
DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export EMACSDIR="$HOME/.config/emacs"
eval "$(starship init zsh)"
# Automatically start tmux if not already inside a session
#if [[ -z "$TMUX" ]]; then
#  exec tmux
#fi
# ~/.zshrc
