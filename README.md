# dotfiles
Home directory skeleton: utilities and config files.

## Linux setup
Run the `./bin/packages.sh` script.

## vim setup
Run `:PlugInstall`

## MacOS setup
Install
[Firefox](https://www.mozilla.org),
[Homebrew](https://brew.sh/), and
[TextMate](https://macromates.com/).

### Add to `~/.profile`
```
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH="$PATH:$HOME/bin"
```

### Install Homebrew packages
```
brew install bash bash-completion ctags git tmux vim w3m
brew cask install alacritty macdown
```

### Change default shell
```
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

Check bash version with Ctrl-x Ctrl-v.
