export CLICOLOR=1
export EDITOR=nvim
export PATH="$PATH:/usr/local/go/bin:$HOME/bin"

# Java + Android Studio
if [ -e /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
else
    export JAVA_HOME=/usr/lib/jvm/default-java
fi
if [ -d ~/Library/Android/sdk ]; then
  ANDROID_SDK_ROOT=~/Library/Android/sdk
fi

# Ruby
if command -v brew >/dev/null 2>&1; then
    HOMEBREW_PREFIX="$(brew --prefix)"
    PATH="${HOMEBREW_PREFIX}/opt/ruby/bin:$PATH"
fi
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# add with `security add-generic-password -a "$USER" -s "NPM_TOKEN" -w "something"`
export NPM_TOKEN=$(security find-generic-password -a "$USER" -s "NPM_TOKEN" -w 2>/dev/null)
