function fish_prompt
    # Check for an active virtual environment (works for venv, virtualenv, and uv)
    if set -q VIRTUAL_ENV
        set -l venv_name (basename "$VIRTUAL_ENV")
        # Print the venv name in green, parentheses, and with a space after
        echo -n -s (set_color green) '('$venv_name') ' (set_color normal)
    end

    # --- Original prompt logic ---
    set -l symbol '$ '
    set -l color $fish_color_cwd
    if fish_is_root_user
        set symbol ' # '
        set -q fish_color_cwd_root
        and set color $fish_color_cwd_root
    end

    echo -n $USER@$hostname
    echo -n ' '
    set_color $color

    set -l display_path (string replace "$HOME" "~" (pwd))
    echo -n $display_path

    set_color normal

    echo

    echo -n $symbol
end
