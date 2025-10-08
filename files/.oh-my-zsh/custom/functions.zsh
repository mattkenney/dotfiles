function dirdiff()
{
  DIR1=$(printf '%q' "$1")
  shift
  DIR2=$(printf '%q' "$1")
  shift
  vim $@ -c "DirDiff $DIR1 $DIR2"
}

if [[ $(uname) == Darwin ]]; then
  function lsx()
  {
    CLICOLOR_FORCE=1 ls -ahlv "${@:-.}"|less -FRX
  }
else
  function lsx()
  {
    ls -ahlv --color "${@:-.}"|less -FRX
  }
fi
