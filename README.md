# dotfiles
Home directory skeleton: utilities and config files.

## Linux setup
Run the `./bin/packages.sh` script.

## MacOS setup
Install
[Firefox](https://www.mozilla.org),
[Homebrew](https://brew.sh/), and
[nvm](https://github.com/nvm-sh/nvm).

### Install Homebrew packages
```
brew install bash bash-completion git neovim ripgrep tmux w3m
brew install --cask alacritty macdown
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

## Bash notes
Notes on using bash are [here](bash.md).
