# shared custom config bash/zsh

if [ -r ~/.oh-my-zsh/custom/aliases.zsh ]; then
    . ~/.oh-my-zsh/custom/aliases.zsh
fi
if [ -r ~/.oh-my-zsh/custom/functions.zsh ]; then
    . ~/.oh-my-zsh/custom/functions.zsh
fi
if [ -r ~/.oh-my-zsh/custom/variables.zsh ]; then
    . ~/.oh-my-zsh/custom/variables.zsh
fi

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
