# ~/.config/shell/bash_profile.sh — bash login shell
# Sourced from ~/.bash_profile via a managed block added by ./install.

# shared custom config bash/zsh

for f in env aliases functions local; do
    if [ -r ~/.config/shell/$f.sh ]; then
        . ~/.config/shell/$f.sh
    fi
done

# shell completion

if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# source other startup files
if [ -r ~/.profile ]; then
    . ~/.profile
fi
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

# source .node_auth_token, but only if group and other have no access.
# stat is not portable: GNU wants -c %A, BSD/macOS wants -f %Sp. Both print a
# symbolic mode like -rw-------, so try GNU first and fall back to BSD. If
# neither works the mode stays empty and the file is not sourced.
if [ -r ~/.node_auth_token ]; then
    _nat_perm=$(stat -c '%A' ~/.node_auth_token 2>/dev/null \
             || stat -f '%Sp' ~/.node_auth_token 2>/dev/null)
    case "$_nat_perm" in
        ????------*) . ~/.node_auth_token ;;
    esac
    unset _nat_perm
fi
