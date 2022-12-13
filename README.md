# dotfiles

https://github.com/jesuswasrasta/dotfiles
https://www.atlassian.com/git/tutorials/dotfiles

Installation

Method 1
```
echo ".dotfiles" >> .dotfilesignore
```

```
git clone --bar --recurse-submodules git@github.com:quinn-collins/dotfiles.git $HOME/.dotfiles
```

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

```
dotfiles checkout master
```

```
dotfiles config --local status.showUntrackedFiles no
```

```
dotfiles config --local  core.excludesFile=.dotfilesignore
```

Can remove existing files with this command:
```
mkdir -p .dotfiles-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

Method 2

Script:
```
git clone --bare git@github.com:quinn-collins/dotfiles.git $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles repository.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
dotfiles config --local core.excludesFile=.dotfilesignore
```