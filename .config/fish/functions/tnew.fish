# Defined in - @ line 1
function tnew --wraps=tmux --description 'alias tnew=tmux new'
    if test (count $argv) -gt 0
        tmux new -t $argv
    else
        tmux new
    end
end
