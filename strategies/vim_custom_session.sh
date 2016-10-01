#!/usr/bin/env bash

# "vim custom session strategy"
#
# Restores a vim session from some session the lives in ~/.vim/sessions
# dir. See: https://github.com/vim-scripts/sessionman.vim
# FIXME For now it uses my custom function to workaround some vim
# issues with "columns". Make it more general later.
# TODO This is still a workaround to tmux-ressurrect issues to
# restore process with arguments with spaces, such as in this case
# vim "+SessionOpen somesession". More investigation is needed to
# solve this specific problem, not sure how to do that now.

ORIGINAL_COMMAND="$1"
DIRECTORY="$2"

main() {
  local args=( $ORIGINAL_COMMAND ) i=0
  while (( i < ${#args[@]} )); do
    [[ ${args[i]} = "+SessionOpen" ]] && break
    i=$((i+1))
  done

  if (( i+1 < ${#args[@]} )); then
    echo "v ${args[i+1]}"
  else
    echo "$ORIGINAL_COMMAND"
  fi
}

main
