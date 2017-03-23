# chruby
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

#shortcuts for bundle
alias be='bundle exec'
alias ber='bundle exec rspec'
alias bec='bundle exec rails c'
alias rf='rg --files --glob'

# export DISPLAY=:0.0
# export EDITOR=/usr/local/bin/vim

# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# # zsh settings.
# export HISTSIZE=10000
# export SAVEHIST=10000
# export HISTFILE=~/.zsh_history
# bindkey -e
# bindkey '^R' history-incremental-search-backward
# autoload -U promptinit; promptinit
# prompt pure
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '^ ' autosuggest-accept
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"
# autoload -Uz compinit
# compinit
# setopt inc_append_history
# setopt share_history


# # fzf.
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # fasd.
# eval "$(fasd --init auto)"
# alias j='fasd_cd -d'
