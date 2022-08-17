ID="4da1f2ae4ef03a88efef3ebbc745ac0d"

function ge () {
  gh gist edit $ID -a "$@";
}

function gv () {
  gh gist view -w $ID;
}
