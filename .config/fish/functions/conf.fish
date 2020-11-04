# Defined in - @ line 1
function conf --wraps='nvim (find ~/.config/ -maxdepth 2 -type f | fzf --height=30% --reverse)' --description 'alias conf=nvim (find ~/.config/ -maxdepth 2 -type f | fzf --height=30% --reverse)'
  nvim (find ~/.config/ -maxdepth 2 -type f | fzf --height=30% --reverse) $argv;
end
