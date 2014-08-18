#!/usr/bin/env bash
 
cmd="$(tmux display -p '#{pane_current_command}' | xargs basename | tr A-Z a-z)"
[ "${cmd%m}" = "vi" ] && vim=true || vim=false
 
pane="$(tmux display -p '#{pane_index}')"
pane=$[ pane + 1 ]
panes="$(tmux display -p '#{window_panes}')"
 
if [[ "$@" = "-L" && $pane == 1 || "$@" = '-R' && $pane == $panes ]]; then
  cmd="tmux resize-pane -Z"
else
  cmd="tmux select-pane $@"
fi
 
if $vim; then
  wincmd="$(echo "${1#-}" | tr 'lLDUR' 'phjkl')"
  tmux send-keys ":let nr = winnr() | wincmd $wincmd" C-m
  tmux send-keys ":if nr == winnr() | silent call system(\"$cmd\") | end"
  tmux send-keys C-m ':echo "\r"' C-m
else
  $cmd
fi

