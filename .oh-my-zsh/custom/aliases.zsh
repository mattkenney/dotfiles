alias c='cd "$(picode)"'
alias cdk='npx --package aws-cdk cdk'
alias cpx='cp -i'
alias datex='date -u +%Y-%m-%dT%H:%M:%SZ'
alias fo='sed "s/   */,/g"|vd --filetype=csv'
alias jqs='jq .scripts package.json'
alias kc=kubectl
alias kj='kubectl --output json'
alias kk='$(pickube)'
alias mvx='mv -i'
alias n=npm
alias ng='npx --package @angular/cli ng'
alias na='npm run --if-present lint && npm run --if-present format && npm run --if-present build'
alias nr='npm run'
alias nsx='lsof -P -iTCP -n -sTCP:LISTEN'
alias po='pino-pretty --colorize --translateTime "UTC:yyyy-mm-dd'"'"'T'"'"'HH:MM:ss'"'"'Z'"'"'"|less -R;reset'
alias psx='ps -o user,pid,ppid,command'
alias sedi='perl -pi -e'
alias sm='alacritty --option font.size=10 --option window.dimensions.lines=80 &'
alias v=nvim
alias vim=nvim
alias vimdiff='nvim -d'

if [ $(uname) = Darwin ]; then
    alias ssh='ssh -o "XAuthLocation=/opt/X11/bin/xauth"'
fi
