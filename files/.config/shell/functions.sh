# ~/.config/shell/functions.sh
# Functions shared by bash and zsh. POSIX sh only.

dirdiff()
{
  DIR1=$(printf '%q' "$1")
  shift
  DIR2=$(printf '%q' "$1")
  shift
  vim $@ -c "DirDiff $DIR1 $DIR2"
}

lsx()
{
  if [ "$(uname)" = Darwin ]; then
    CLICOLOR_FORCE=1 ls -ahlv "${@:-.}"|less -FRX
  else
    ls -ahlv --color "${@:-.}"|less -FRX
  fi
}
