#!/usr/bin/env bash

DIRS=(
  "$HOME/work"
  "$HOME/uni"
)

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find "${DIRS[@]}" . -type d -mindepth 1 -maxdepth 1 \
    | sed "s|^$HOME/||" \
    | fzf --margin 10% --color="bw")

  [[ $selected ]] && selected="$HOME/$selected"
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t "$selected_name"; then
  tmux new-session -ds "$selected_name" -c "$selected"
  tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"

