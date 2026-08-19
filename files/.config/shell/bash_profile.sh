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

# source .node_auth_token, but only if it's not world-readable
if [ -r ~/.node_auth_token ] && [ "$(stat -f %Sp ~/.node_auth_token | sed 's/^....//')" == "------" ]; then
    . ~/.node_auth_token
fi
