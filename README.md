# dotfiles

A collection of my personal dotfiles and configuration settings for development tools, designed for easy setup and consistent experience across different systems.

## How to add "dotfiles" to this repository

Assuming this repository is cloned in my home directory like:
`$HOME/dotfiles`

Example of adding `~/.config/nvim`:

```bash
# Backup existing files (just in case)
mkdir -p ~/dotfiles_backup/.config/
mv ~/.config/nvim/ ~/dotfiles_backup/.config/

# Create symbolic link
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

Commit & push within the dotfiles directory.

## How to setup "dotfiles" on a new system

```bash

```

## memo

### zsh

```bash
cp ~/.zshrc ~/.zshrc.bak
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

### tmux

```bash
cp ~/.tmux.conf ~/.tmux.conf.bak
rm ~/.tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

### LazyGit Config

requires:

- lazygit

```bash
cp ~/Library/Application\ Support/lazygit/config.yml .
mv ~/Library/Application\ Support/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.ymlconfig.yml.bk
ln -s ~/dotfiles/lazygit/config.yml /Users/y_yoshida/Library/Application\ Support/lazygit/config.yml
```

optional:

- delta

install

```bash
brew install git-delta
```

.gitconfig setting

```bash
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
```
