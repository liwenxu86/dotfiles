[ -f "$LOCAL_ADMIN_SCRIPTS/master.zshrc" ] && source "$LOCAL_ADMIN_SCRIPTS/master.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Disable C-S and C-Q
if [[ -t 0 && $- = *i* ]]
then
    stty -ixon
fi 

# Disable globbing
set -o no_extended_glob

# Don't save duplicate commands in history
setopt HIST_IGNORE_DUPS

export GPG_TTY=$(tty)
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
autoload -U colors
colors
setopt prompt_subst

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
export PATH="$HOME/bin:/usr/local/Cellar/tmux/3.3a_1/bin:$PATH"
# openssl
export PATH="/usr/local/opt/openssl@1.1/bin/:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

if command -v nvim > /dev/null 2>&1; then
  if [[ ! -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
  else
    export EDITOR='mvim'
  fi
  alias vi=nvim
fi

#alias rm='rm -i'
alias gitcleanbranch='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias mydu='du -ks * | sort -nr | cut -f2 | sed '"'"'s/^/"/;s/$/"/'"'"' | xargs du -sh'
alias grepr='grep -r -n --color=auto'
alias ipython='ipython notebook --matplotlib inline'
alias ls='ls -G'
alias l='ls -alF'
alias ll='ls -l'
alias mv='mv -i'
alias mydu='du -ks * | sort -nr | cut -f2 | sed '"'"'s/^/"/;s/$/"/'"'"' | xargs du -sh'
alias screen='screen -e\`n -s /bin/bash'
alias tmux='export TERM=xterm-256color; /usr/local/bin/tmux'
alias vim='vim -X -O'

# git aliases
alias gs="git status"
alias gdc="git diff --cached"

alias doc="docker"
alias dcc="docker-compose"

# bash completion
if [ -f $HOME/.zsh/bash_completion ]; then
#   . $HOME/.zsh/bash_completion
fi

#zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
#
## Git completion
#fpath+=$HOME/.zsh/_git

# Command line vi mode
set -o vi

# reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward

# https://unix.stackexchange.com/questions/290392/backspace-in-zsh-stuck
bindkey -v '^?' backward-delete-char

# zsh prompt formatting
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# zsh git autocomplete
autoload -Uz compinit && compinit

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
