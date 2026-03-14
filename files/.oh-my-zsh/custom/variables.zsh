export CLICOLOR=1
export EDITOR=nvim
PATH="$PATH:/usr/local/go/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/bin"

# Prevent accidental shell exit from Ctrl-D at an empty prompt.
setopt IGNORE_EOF

# Java + Android Studio
if [ -e /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
else
    export JAVA_HOME=/usr/lib/jvm/default-java
fi
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd
export ANDROID_SDK_ROOT=$ANDROID_HOME
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/platform-tools

# Ruby
if command -v brew >/dev/null 2>&1; then
    HOMEBREW_PREFIX="$(brew --prefix)"
    PATH="${HOMEBREW_PREFIX}/opt/ruby/bin:$PATH"
fi
export GEM_HOME=$HOME/.gem
PATH=$GEM_HOME/bin:$PATH
