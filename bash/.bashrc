# which environment am i on?
if [[ $(hostname -s) =~ ^CMM ]]; then
  MY_HOST="\[\e[0;32m\]CMM";
  MY_HOST="🤖";
elif [[ $(hostname -s) =~ ^vagrant ]]; then
  MY_HOST="\[\e[0;31m\]VGR";
  MY_HOST="💩";
else
  MY_HOST="👽";
fi

# source installed files

# bash_completion
command -v brew >/dev/null 2>&1 &&
  [[ -f $(brew --prefix)/etc/bash_completion ]] &&
  { . $(brew --prefix)/etc/bash_completion; }

# ehruby
[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ] && . /usr/local/opt/chruby/share/chruby/chruby.sh
command -v chruby >/dev/null 2>&1 && [[ "$MY_HOST" =~ '🤖'$ ]] && { chruby 2.2.2; }

# fasd
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
alias jj='fasd_cd -d -i'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# git hub
command -v hub >/dev/null 2>&1 && { eval "$(hub alias -s)"; }

# git status
[ -f ~/.git-prompt.sh ] && . ~/.git-prompt.sh

alias ls='ls -G'

# Control the command history
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTCONTROL=ignoredups:erasedups
stty -ixon

# If there is a bin directory in the users home add it to path
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

# setup ssh
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# prompt
PS1_COLOR_RESET="\[\e[0m\]"
PS1_DIRECTORY="\[\e[00;37m\] \w> "
PS1_GIT_BRANCH="\[\e[0;35m\]\$(__git_ps1)"

PS1_COMBINED=""
PS1_COMBINED+=$MY_HOST
PS1_COMBINED+=$PS1_GIT_BRANCH
PS1_COMBINED+=$PS1_DIRECTORY
PS1_COMBINED+=$PS1_COLOR_RESET

export PS1=$PS1_COMBINED

#set default bash editor to vim
export VISUAL=vim
export EDITOR="$VISUAL"

#functions
cl() { history -p '!!'|tr -d \\n|pbcopy; }

# fasd + fzf for directory + vim
j() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

v() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vim "${file}" || return 1
}
