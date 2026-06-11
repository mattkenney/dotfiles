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

epochms()
{
  perl -MTime::HiRes=time -e 'printf "%.0f\n", time() * 1000'
}

epochs()
{
  perl -e 'printf "%.0f\n", time()'
}

lsx()
{
  if [ "$(uname)" = Darwin ]; then
    CLICOLOR_FORCE=1 ls -ahlv "${@:-.}"|less -FRX
  else
    ls -ahlv --color "${@:-.}"|less -FRX
  fi
}
