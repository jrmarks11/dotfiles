pull this into home
delete conflicting files in your home directory
```
.bash_profile
.bashrc
.vimrc
.gitconfig
.gitignore_global
```

run the following
```
cd ~/dotfiles
stow bash
stow vim
stow git
stow scripts
```

after you pull this you need to pull the submodules
```
git up
```

if reinstalling run stow with -R like so
```
stow -R vim
...
```

