# ~/.config/shell/zshrc.zsh — interactive zsh configuration
# Sourced from ~/.zshrc via a managed block added by ./install.

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt share_history hist_ignore_dups hist_ignore_space extended_history

# Options
setopt interactive_comments auto_cd
setopt IGNORE_EOF   # don't exit on Ctrl-D at an empty prompt

# Completion
if command -v brew >/dev/null 2>&1; then
    fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' menu select

# Prompt: robbyrussell-style, via zsh's built-in vcs_info (no dependency)
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
# Colors mirror oh-my-zsh's robbyrussell: bold blue "git:(", red branch, blue
# ")". The whole segment is bold (%B); reset happens in PROMPT below, because %b
# means "branch" inside vcs_info formats, not "bold off".
zstyle ':vcs_info:git:*' formats       ' %B%F{blue}git:(%F{red}%b%F{blue})%m'
zstyle ':vcs_info:git:*' actionformats ' %B%F{blue}git:(%F{red}%b%F{blue}|%F{red}%a%F{blue})%m'
# Single yellow ✗ for any dirty tree (staged, unstaged, or untracked), via a hook
# into %m -- avoids the doubled ✗ that %u%c produces when more than one applies.
zstyle ':vcs_info:git*+set-message:*' hooks git-dirty
+vi-git-dirty() {
    if [[ -n $(git status --porcelain --ignore-submodules 2>/dev/null) ]]; then
        hook_com[misc]=' %F{yellow}✗'
    fi
}
precmd() { vcs_info }
# Trailing %f%b resets the foreground and bold left on by the vcs_info segment.
PROMPT='%(?:%B%F{green}➜:%B%F{red}➜)%b%f %F{cyan}%c%f${vcs_info_msg_0_}%f%b '
if [[ -n "$SSH_CONNECTION" ]]; then
    RPROMPT='%m'
fi

# Shared (bash+zsh) environment, aliases, functions, and machine-local overrides
# (local.sh is untracked: a home for per-machine config and installer overflow).
# Use if/then (not &&) so a missing file leaves $? = 0 -- otherwise the trailing
# failed test makes the first prompt show the red (last-command-failed) arrow.
for f in env aliases functions local; do
    if [ -r "$HOME/.config/shell/$f.sh" ]; then
        . "$HOME/.config/shell/$f.sh"
    fi
done
