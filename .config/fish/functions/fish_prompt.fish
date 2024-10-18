# name: Custom

function edit_command_buffer
    set -l temp_file (mktemp)
    commandline > $temp_file
    $EDITOR $temp_file
    commandline (cat $temp_file)
    rm $temp_file
end


function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -l normal (set_color normal)

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l prefix
    set -l suffix '$'
    if contains -- $USER root toor
        if set -q fish_color_cwd_root
            set fishprompt_color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # If we're running via SSH, change the host color.
    set -l local_color_host $fishprompt_color_host
    if set -q SSH_TTY
        set local_color_host $fishprompt_color_host_remote
    end

    # Write pipestatus
    set -l prompt_status (__fish_print_pipestatus " [" "]" "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)

    echo -n -s (set_color -o $fishprompt_color_bracket) '[' (set_color -o $fishprompt_color_user) "$USER" (set_color -o $fishprompt_color_at) @ \
        (set_color -o $local_color_host) (prompt_hostname) ' ' (set_color -o $fishprompt_color_cwd) (prompt_pwd) \
        $normal (fish_vcs_prompt) (set_color -o $fishprompt_color_bracket) ']' $normal $prompt_status \
        (set_color -o $fishprompt_color_suffix) $suffix " "
end
