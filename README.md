# dotfiles
Home directory skeleton: utilities and config files.

---
## Linux (Debian/Ubuntu) setup

Install
[Oh My Zsh](https://ohmyz.sh/#install),
[Rust](https://www.rust-lang.org/),
[WezTerm](https://wezterm.org/install/linux.html), and
[nvm](https://github.com/nvm-sh/nvm).

### Install dotfiles
Clone this repo and run the `./install`, `./bin/git-set-user`, and
`./bin/packages.sh` scripts.

Change default shell to zsh (`chsh`).

---
## MacOS setup
Run `xcode-select --install` to install Xcode command line tools.

If on Apple silicon, run `softwareupdate --install-rosetta` to install Rosetta 2.

Install
[Chrome](https://www.google.com/chrome/),
[Firefox](https://www.mozilla.org),
[Homebrew](https://brew.sh/),
[Oh My Zsh](https://ohmyz.sh/#install),
[Rust](https://www.rust-lang.org/), and
[nvm](https://github.com/nvm-sh/nvm).

### Install Homebrew packages
```
brew install bash bash-completion git luarocks neovim python-setuptools ripgrep ruby tmux w3m
brew install --cask clipy wezterm
```

### Install dotfiles
Clone this repo and run the `./install` and `./bin/git-set-user` scripts.

---
## Additional notes

Notes on using MacOS Terminal are [here](docs/macos-terminal.md).

Notes on using Oh My Zsh are [here](docs/oh-my-zsh.md).

Notes on using bash are [here](docs/bash.md).
