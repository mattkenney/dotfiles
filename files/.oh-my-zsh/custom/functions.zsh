function dirdiff()
{
  DIR1=$(printf '%q' "$1")
  shift
  DIR2=$(printf '%q' "$1")
  shift
  vim $@ -c "DirDiff $DIR1 $DIR2"
}

function lsx()
{
  if [ $(uname) = Darwin ]; then
    CLICOLOR_FORCE=1 ls -ahlv "${@:-.}"|less -FRX
  else
    ls -ahlv --color "${@:-.}"|less -FRX
  fi
}
