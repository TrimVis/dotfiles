# Defined in - @ line 1
function topen
    set -l session (tmux list-sessions | sed 's/ (group .*//;s/: /:#/;s/ (/#(/' | column -t -s '#' | fzf --reverse --height=20 --no-info | sed 's/: .*//g')
    if test -n "$session"
        command tmux a -t "$session"
    end
end
