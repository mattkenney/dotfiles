# Notes on Oh My Zsh

Install [Oh My Zsh](https://ohmyz.sh/#install).

Optionally enable
[kube\_ps1](https://github.com/jonmosco/kube-ps1)
by editing ~/.zshrc, adding the kube\_ps1 plugin included with oh-my-zsh:

```
plugins=(
  git
  kube-ps1
)
```

and adding this PROMPT under `# User configuration`:

```
KUBE_PS1_DIVIDER=' '
KUBE_PS1_PREFIX=
KUBE_PS1_SUFFIX=' '
KUBE_PS1_SYMBOL_ENABLE=false
PROMPT='$(kube_ps1)'$PROMPT'$ '
```
