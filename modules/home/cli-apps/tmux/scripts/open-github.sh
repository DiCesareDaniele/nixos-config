#!/usr/bin/env bash

PATHS=(
  $(tmux run "echo #{pane_current_path}")
  $(tmux run "echo #{pane_start_path}")
)

for path in "${PATHS[@]}"; do
  cd "$path"
  url=$(git remote get-url origin)
  if [[ $url == *github.com* ]]; then
    if [[ $url == git@* ]]; then
      url="${url#git@}"
      url="${url/:/\/}"
      url="https://$url"
    fi
    xdg-open "$url"
    exit 0
  fi
done

echo "This repository is not hosted on GitHub"

