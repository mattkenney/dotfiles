# Minimal Setup
The `.vimrc` file here can be used as-is for vim without installing Neovim or
any vim plugins.

After these dotfiles are set up on a workstation, a minimal config to be added
to `.bash_profile` or `.zshrc` elsewhere can be printed with:

```
alias cpx datex gai gdf jo jqs mvx nr nsx psx sedi | \
  sed 's/^/alias /' && \
  printf 'alias v=vim\n' && \
  declare -f lsx
```
