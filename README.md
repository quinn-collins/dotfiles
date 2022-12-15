
# Dotfiles


## References

https://github.com/jesuswasrasta/dotfiles

https://www.atlassian.com/git/tutorials/dotfiles

## Cloning and Checking Out

### Expected binaries

```
apt update && apt install git curl zsh vim fzf -y
```
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Method 1

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
```
echo ".dotfiles" >> .dotfilesignore
```
```
git clone --bare --recurse-submodules https://github.com/quinn-collins/dotfiles.git $HOME/.dotfiles
```
```
dotfiles checkout
```
If checkout fails due to existing files, either delete them or run the following script that backs up the culprit files.
```
#!/bin/bash
mkdir -p .dotfiles-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```
If checkout failed, run it again after fixing errors. Then continue.
```
dotfiles config --local status.showUntrackedFiles no
```
```
dotfiles config --local  core.excludesFile=.dotfilesignore
```

### Method 2

Within `.bin` folder there is a script called `clone-checkout-dotfiles` that can be downloaded with `curl` and then passed to `/bin/bash`

```
curl -Lks https://raw.githubusercontent.com/quinn-collins/dotfiles/main/clone-checkout-dotfiles | /bin/bash
```

## Managing Vim Plugin With Git Subtree Examples

Add
```
dotfiles subtree add --prefix .vim/pack/all/start/tpope-vim-surround https://tpope.io/vim/surround.git master --squash
```
Update
```
dotfiles subtree pull --prefix .vim/pack/all/start/tpope-vim-surround https://tpope.io/vim/surround.git master --squash
```
Delete
```
rm -rf .vim/pack/all/start/tpope-vim-surround
```

## Setting up Coc.vim
Install nvm, node, and npm
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
```
```
nvm install --lts
```
Install yarn and run install on coc.vim
```
npm install -g yarn
```
```
cd ~/.vim/pack/all/start/coc.nvim && yarn install && cd -
```
