# dotfiles
Home directory skeleton: utilities and config files.

## Install
Run the `./install` script.

## Linux setup
Run the `./bin/packages.sh` script.

## MacOS setup
Run `xcode-select --install` to install Xcode command line tools.

If on Apple silicon, run `softwareupdate --install-rosetta` to install Rosetta 2.

Install
[Firefox](https://www.mozilla.org),
[Chrome](https://www.google.com/chrome/),
[Homebrew](https://brew.sh/), and
[nvm](https://github.com/nvm-sh/nvm).

### Install Homebrew packages
```
brew install bash bash-completion git neovim python-setuptools ripgrep tmux w3m
brew install --cask alacritty clipy
```

## vim setup
Run `~/bin/vim-setup.sh`.

## zsh setup
Install [oh-my-zsh](https://ohmyz.sh/#install).

Optionally enable
[kube\_ps1](https://github.com/jonmosco/kube-ps1)
by editing ~/.zshrc, adding the kube\_ps1 plugin included with oh-my-zsh:

```
plugins=(
  git
  kube-ps1
)
```

and adding this PROMPT under `# User configuration`:

```
KUBE_PS1_DIVIDER=' '
KUBE_PS1_PREFIX=
KUBE_PS1_SUFFIX=' '
KUBE_PS1_SYMBOL_ENABLE=false
PROMPT='$(kube_ps1)'$PROMPT'$ '
```

## Additional notes

Notes on using bash are [here](docs/bash.md).

Notes on using MacOS Terminal are [here](docs/macos-terminal.md).
