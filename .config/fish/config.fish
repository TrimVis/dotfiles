#!/usr/bin/env fish

# Adds `~/.local/bin/` and all subdirectories to $PATH
set -g PATH $PATH (du -a $HOME/.local/bin/ | cut -f2 | tr '\n' ':' | sed 's/:*$//') $HOME/.local/share/cargo/bin/

set -g __fish_git_prompt_show_informative_status 1
#set -g __fish_git_prompt_hide_untrackedfiles 1
set -g __fish_git_prompt_showdirtystate "yes"

set -g __fish_git_prompt_color_branch magenta --bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_color_cleanstate brgreen

set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green --bold
set -g __fish_git_prompt_color_invalidstate red

# Better theme
fish_config theme choose "Dracula Official"


##### KITTY SHELL INTEGRATION #####
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

### Pywall integration
cat ~/.cache/wal/sequences


ufetch
