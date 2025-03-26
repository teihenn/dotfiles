# dotfiles

A collection of my personal dotfiles and configuration settings for development tools, designed for easy setup and consistent experience across different systems.

## How to setup `dotfiles` on a new system

### Prerequisites

- macOS
- Homebrew is installed
- [`aqua`](https://aquaproj.github.io/) (installed via Homebrew)
- Your `.zshrc` will be installed and configured to point to your global `aqua.yaml` (e.g., via `AQUA_GLOBAL_CONFIG`)

> 🛠️ Note: `aqua` and your `.zshrc` can be set up automatically by this setup process.

### Usage

#### Clone the repository to your home directory

```bash
cd
git clone git@github.com:teihenn/dotfiles.git
cd dotfiles
```

#### Run setup

##### Full setup

```bash
make
```

##### Partial setup

e.g., Setup `.zshrc` only

```bash
make zsh
```

#### Show avaliable make commands

```bash
make help
```

## How to add `dotfiles` to this repository

You can add new dotfiles to this repository by following these steps:

1. Copy or move the config file into the appropriate directory
   For example, to add your `~/.gitconfig`:

```bash
mkdir -p ~/dotfiles/git
cp ~/.gitconfig ~/dotfiles/git/.gitconfig
```

2. Update `setup.sh` to create a symbolic link

Edit `setup.sh` and add a new `install_gitconfig()` function if it doesn't already exist:

```bash
install_gitconfig() {
    log "Setting up gitconfig..."
    backup_and_link "$HOME/.gitconfig" "$DOTFILES_DIR/git/.gitconfig"
}
```

Also, update the `main()` function to support this target:

```bash
gitconfig) install_gitconfig ;;
```

3. Add a Makefile target

```bash
gitconfig: ## Install .gitconfig
 ./setup.sh gitconfig
```

4. Test it

```bash
make gitconfig
```

Check that the symlink is created and the config works as expected.

## Tools that are not managed by dotfiles

### Raycast

Raycast pro plan can manage the settings via cloud sync.

## Reference

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ruff
