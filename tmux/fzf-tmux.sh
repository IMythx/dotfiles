#!/usr/bin/env bash

#NOTE: this script is for use in tmux sessions
# Find files and directories under the home directory, excluding the home directory itself
selected=$(find ~/ -mindepth 1 -maxdepth 3 | fzf --height 40% --inline-info)

if [[ -n "$selected" ]]; then
  # Check if the selected path is a directory
  if [[ -d "$selected" ]]; then
    # Change directory to the selected directory
    cd "$selected" && nvim || {
      echo "Failed to change directory to '$selected'."
      exit 1
    }
  elif [[ -f "$selected" ]]; then
    # Open the selected file with nvim
    nvim "$selected" || {
      echo "Failed to open '$selected' with nvim."
      exit 1
    }
  else
    echo "'$selected' is neither a file nor a directory."
    exit 1
  fi
else
  echo "No selection made."
  exit 1
fi

# #NOTE: if you want it to be session instead
# if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
#     # tmux new-session -s $selected_name -c $selected
#     exit 0
# fi
# if ! tmux has-session -t=$selected_name 2> /dev/null; then
#     tmux new-session -ds $selected_name -c $selected
# fi
#
# tmux switch-client -t $selected_name
