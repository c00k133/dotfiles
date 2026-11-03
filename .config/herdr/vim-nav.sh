#!/bin/sh
# Vim-aware pane navigation for herdr, like vim-tmux-navigator.
# Usage: vim-nav.sh <left|down|up|right> <key>
# Sends <key> to the focused pane when vim/fzf is in the foreground, else focuses the neighbor pane.
set -eu
dir=$1 key=$2
# Bindings run detached, so resolve the pane the user has focused, not one inherited from the environment.
unset HERDR_PANE_ID
info=$(herdr pane process-info --current)
pane=$(printf '%s' "$info" | jq -r '.result.process_info.pane_id')
# Same programs as the tmux regex, including Nix wrappers such as .nvim-wrapped.
if printf '%s' "$info" | jq -e '
  [.result.process_info.foreground_processes[] | .name, (.argv0 | sub(".*/"; ""))]
  | any(test("^\\.?g?(view|fzf|l?n?vim?x?)(-wrapped)?(-w)?(diff)?$"))' >/dev/null; then
  herdr pane send-keys "$pane" "$key"
else
  herdr pane focus --pane "$pane" --direction "$dir"
fi
