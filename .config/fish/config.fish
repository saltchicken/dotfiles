source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
end

fish_vi_key_bindings

function gstyle
    # 1. Determine targets
    set targets $argv
    if not set -q targets[1]
        set targets **/*.py
    end

    if not count $targets >/dev/null
        set_color red
        echo "No Python files found in the target directory."
        set_color normal
        return 1
    end

    # 2. isort
    echo ""
    set_color cyan --bold
    echo "========================================"
    echo "🚀 [1/4] Running isort (Sorting Imports)"
    echo "========================================"
    set_color normal
    isort --profile google $targets
    set_color green
    echo "  -> isort check complete."
    set_color normal

    # 3. yapf
    echo ""
    set_color magenta --bold
    echo "========================================"
    echo "🎨 [2/4] Running yapf (Formatting)"
    echo "========================================"
    set_color normal
    yapf -i --print-modified --style google $targets
    set_color green
    echo "  -> yapf check complete."
    set_color normal

    # 4. pylint
    echo ""
    set_color yellow --bold
    echo "========================================"
    echo "🔍 [3/4] Running pylint (Linting)"
    echo "========================================"
    set_color normal
    pylint $targets

    # 5. pyright
    echo ""
    set_color green --bold
    echo "========================================"
    echo "🛡️  [4/4] Running pyright (Type Checking)"
    echo "========================================"
    set_color normal
    pyright $targets

    echo ""
    set_color green --bold
    echo "✅ All checks complete!"
    set_color normal
end
