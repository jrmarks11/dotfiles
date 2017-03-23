autoload -Uz compinit
compinit
bindkey -e
# bindkey '^R' history-incremental-search-backward
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '^ ' autosuggest-accept

autoload -U promptinit; promptinit
prompt pure

[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ] && . /usr/local/opt/chruby/share/chruby/chruby.sh
command -v chruby >/dev/null 2>&1  && { chruby 2.2.2; }

# git hub
command -v hub >/dev/null 2>&1 && { eval "$(hub alias -s)"; }

alias ls='ls -G'

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

# setup ssh
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

#functions
cl() { history -p '!!'|tr -d \\n|pbcopy; }

alias be='bundle exec'
alias ber='bundle exec rspec'
alias bec='bundle exec rails c'
alias rf='rg --files --glob'

export EDITOR=/usr/local/bin/vim

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
setopt inc_append_history
setopt share_history

# fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fasd
if [[ $(command -v fasd) ]]; then
  fasd_cache="$HOME/.fasd-init-zsh"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install>| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache

  alias j='fasd_cd -d'
  alias jj='fasd_cd -d -i'
  alias v='f -e vim'
  vv() {
    local files
    files=$(grep '^>' ~/.viminfo | cut -c3- |
            while read line; do
              [ -f "${line/\~/$HOME}" ] && echo "$line"
            done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
  }
fi
