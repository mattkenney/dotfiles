# ~/.config/shell/zprofile.zsh — zsh login shell (PATH and tool bootstrap)
# Sourced from ~/.zprofile via a managed block added by ./install.

# Homebrew: Apple Silicon, Intel, or Linuxbrew
for _brew in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    if [ -x "$_brew" ]; then eval "$("$_brew" shellenv)"; break; fi
done
unset _brew

# Shared environment (PATH, exports); also sourced from .zshrc for non-login shells
[ -r "$HOME/.config/shell/env.sh" ] && . "$HOME/.config/shell/env.sh"
