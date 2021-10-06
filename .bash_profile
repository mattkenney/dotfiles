# aliases

alias c='$(rwd)'
alias jqs='jq .scripts package.json'
alias kc=kubectl
alias l='$(pickube)'
alias nsx='lsof -P -iTCP -n -sTCP:LISTEN'
alias po='pino-pretty --colorize|less -FRX'
alias psx='ps -o user,pid,ppid,command'

if [ $(uname) == Darwin ]; then
    alias ssh='ssh -o "XAuthLocation=/opt/X11/bin/xauth"'
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

# functions

if [ $(uname) == Darwin ]; then
    function lsx()
    {
        CLICOLOR_FORCE=1 ls -al "${@:-.}"|less -FRX
    }
else
    function lsx()
    {
        ls -al --color "${@:-.}"|less -FRX
    }
fi

# variables

export PATH="$PATH:$HOME/bin"
export CLICOLOR=1
export EDITOR=vim

if [ -e /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
else
    export JAVA_HOME=/usr/lib/jvm/default-java
fi
if [ -d ~/Library/Android/sdk ]; then
  ANDROID_SDK_ROOT=~/Library/Android/sdk
fi

# source other startup files
if [ -f ~/.profile ]; then
    . ~/.profile
fi
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
