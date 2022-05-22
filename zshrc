# Fix up history
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

bindkey -e

if command -v fzf-share &>/dev/null; then
	source "$(fzf-share)/key-bindings.zsh"
	source "$(fzf-share)/completion.zsh"
fi

export PATH="${PATH}:${HOME}/bin"
eval "$(direnv hook zsh)"

alias gs='git status'
alias gd='git diff'
alias ga='git add'
