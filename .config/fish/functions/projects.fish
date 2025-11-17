# Function to select a desktop project, cd into it, and open nvim
function projects
    set selected_dir (~/.cargo/bin/project-dash)
    if test -n "$selected_dir"

        cd "$selected_dir"
        clear
        nvim
        commandline -f repaint
    end
    # If $selected_dir is empty (user pressed 'q'), the function just ends
end
