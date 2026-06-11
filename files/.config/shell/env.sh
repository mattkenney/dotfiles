# ~/.config/shell/env.sh
# Environment shared by bash and zsh. POSIX sh only (no bashisms/zshisms).
# Idempotent: safe to source more than once (e.g. login + interactive).

# Add a directory to PATH only if not already present.
_prepend_path() { case ":$PATH:" in *":$1:"*) ;; *) PATH="$1:$PATH" ;; esac; }
_append_path()  { case ":$PATH:" in *":$1:"*) ;; *) PATH="$PATH:$1" ;; esac; }

export CLICOLOR=1
export EDITOR=nvim

_append_path "$HOME/.local/bin"
_append_path "$HOME/bin"

# Rust / cargo (rustup manages ~/.zshenv itself; this keeps it portable to bash)
[ -d "$HOME/.cargo/bin" ] && _prepend_path "$HOME/.cargo/bin"

# Java
if [ -x /usr/libexec/java_home ]; then          # macOS
    export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
elif [ -d /usr/lib/jvm/default-java ]; then      # Debian-like
    export JAVA_HOME=/usr/lib/jvm/default-java
fi

# Android SDK (macOS layout; harmless to skip elsewhere)
if [ -d "$HOME/Library/Android/sdk" ]; then
    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export ANDROID_AVD_HOME="$HOME/.android/avd"
    export ANDROID_SDK_ROOT="$ANDROID_HOME"
    _append_path "$ANDROID_HOME/emulator"
    _append_path "$ANDROID_HOME/platform-tools"
fi

# Ruby via Homebrew, plus user gems
if command -v brew >/dev/null 2>&1; then
    _prepend_path "$(brew --prefix)/opt/ruby/bin"
fi
export GEM_HOME="$HOME/.gem"
_prepend_path "$GEM_HOME/bin"

unset -f _prepend_path _append_path
