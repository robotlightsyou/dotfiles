#Color palettes
#https://www.color-hex.com/color-palette/94267
function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -l last_status $status
    set -l normal (set_color normal)

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l prefix
    set -l suffix '>'
    if contains -- $USER root toor
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # If we're running via SSH, change the host color.
    set -l color_host $fish_color_host
    if set -q SSH_TTY
        set color_host $fish_color_host_remote
    end

    #change color of git branch if not in mater/primary
#    https://stackoverflow.com/questions/17001757/string-inclusion-in-fish-shell
    set -l git_label (fish_vcs_prompt)
    set -l git_color f18fd1
    set -l  master_color 00ff00
    if string match -q -- '*master*' $git_label || string match -q -- '*primary*' $git_label|| string match -q -- '*main*' $git_label 
        set git_color $master_color
    end

    # Write pipestatus
    set -l prompt_status (__fish_print_pipestatus " [" "]" "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)

    echo -n -s (set_color 00b8ff brcyan) "$USER" $normal (set_color 0000ff blue) @ (set_color ff00c1 brmagenta) (prompt_hostname) $normal ' ' (set_color 9600ff) (prompt_pwd) $normal (set_color $git_color) "$git_label" $normal $prompt_status " " (set_color cyan)'❯'(set_color magenta)'❯'(set_color normal)'❯ '
end
