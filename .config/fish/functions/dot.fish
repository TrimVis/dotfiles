# Defined in - @ line 1
function dot --wraps=git --description 'alias dot=git dotfiles'
    git --git-dir="$HOME/.config/git-bare-repo/" --work-tree="$HOME" $argv
end
