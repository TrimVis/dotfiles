# Defined in - @ line 1
function conf --wraps='nvim (find ~/.config/ -maxdepth 3 -type f | fzf --height=30% --reverse)' --description 'alias conf=nvim (find ~/.config/ -maxdepth 3 -type f | fzf --height=30% --reverse)'
    set files (find ~/.config/ -maxdepth 3 -type f | fzf --height=30% --reverse)
    if test -n "$files"
        command vim $files
    end
end
