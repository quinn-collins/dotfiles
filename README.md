# Dotfiles

## References

<https://www.atlassian.com/git/tutorials/dotfiles>

<https://github.com/jesuswasrasta/dotfiles>

## Setup

### Expected binaries

```bash
apt update && apt install git curl zsh vim fzf -y
```

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Automated install

```bash
curl -Lks https://raw.githubusercontent.com/quinn-collins/dotfiles/main/.local/bin/clone-checkout-dotfiles | /bin/bash
```

### Manual install

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

```bash
echo ".dotfiles" >> .dotfilesignore
```

```bash
git clone --bare --recurse-submodules https://github.com/quinn-collins/dotfiles.git $HOME/.dotfiles
```

```bash
dotfiles checkout
```

If checkout fails due to existing files, either delete them or run the following script that backs up the culprit files.

```bash
#!/bin/bash
mkdir -p .dotfiles-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

If checkout failed, run it again after fixing errors. Then continue.

```bash
dotfiles config --local status.showUntrackedFiles no
```

```bash
dotfiles config --local  core.excludesFile=.dotfilesignore
```

### From scratch

If you aren't using this repository to track your dotfiles

```bash
1) git init --bare $HOME/.dotfiles
2) alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
3) dotfiles config --local status.showUntrackedFiles no
4) dotfiles config --local core.excludesFile=.dotfilesignore
5) echo ". ~/.zsh_aliases" >> $HOME/.zshrc
6) echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zsh_aliases
7) echo "alias dfg=dotfiles" >> $HOME/.zsh_aliases
```

## Managing Vim Plugin With Git Subtree Examples

Add

```bash
dotfiles subtree add --prefix .vim/pack/all/start/tpope-vim-surround https://tpope.io/vim/surround.git master --squash
```

Update

```bash
dotfiles subtree pull --prefix .vim/pack/all/start/tpope-vim-surround https://tpope.io/vim/surround.git master --squash
```

Delete

```bash
rm -rf .vim/pack/all/start/tpope-vim-surround
```
