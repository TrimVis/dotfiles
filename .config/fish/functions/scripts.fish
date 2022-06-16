# Defined in - @ line 1
function scripts --wraps='nvim (find ~/.local/bin -maxdepth 2 -type f | fzf --height=30% --reverse)' --description 'alias scripts=nvim (find ~/.local/bin -maxdepth 2 -type f | fzf --height=30% --reverse)'
 find ~/.local/bin -maxdepth 2 -type f | fzf --height=30% --reverse | xargs -r nvim;
end
