export CLICOLOR=1
export EDITOR=nvim
export PATH="$PATH:/usr/local/go/bin:$HOME/bin"

if [ -e /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
else
    export JAVA_HOME=/usr/lib/jvm/default-java
fi
if [ -d ~/Library/Android/sdk ]; then
  ANDROID_SDK_ROOT=~/Library/Android/sdk
fi
