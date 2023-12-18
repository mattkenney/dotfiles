# dotfiles
Home directory skeleton: utilities and config files.

## Create `~/.bashrc` and `~/.profile` if necessary.
Tools like RVM, NVM, and SDKMAN may modify `.bash_profile` if these
files do not exist. It is cleaner to keep those changes separate.

```
if [ ! -f ~/.profile ]; then
    touch ~/.profile
fi
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
fi
```

## Linux setup
Run the `./bin/packages.sh` script.

In Gnome Terminal preferences, enable the "Run command as a login shell" option
- this changes how the
[start up files](https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html)
are processed.

## vim setup
Run `:PlugInstall` and `:CocInstall coc-json coc-tsserver`

## MacOS setup
Install
[Firefox](https://www.mozilla.org) and
[Homebrew](https://brew.sh/).

### Install Homebrew packages
```
brew install bash bash-completion ctags git tmux vim w3m
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew cask install alacritty macdown
```

### Change default shell
```
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

Check bash version with Ctrl-x Ctrl-v.
