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

