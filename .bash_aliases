# aliases

alias c='$(rwd)'

if [ $(uname) == Darwin ]; then
    alias ssh='ssh -o "XAuthLocation=/opt/X11/bin/xauth"'
fi

# functions

if [ $(uname) == Darwin ]; then
    function lsx()
    {
        CLICOLOR_FORCE=1 ls -al "${1:-.}"|less -FRX
    }
else
    function lsx()
    {
        ls -al --color "${1:-.}"|less -FRX
    }
fi

# variables

export CLICOLOR=1
export EDITOR=vim

if [ -e /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
else
    export JAVA_HOME=/usr/lib/jvm/default-java
fi
