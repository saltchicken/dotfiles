source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end

fish_vi_key_bindings

bind \eo last_out
bind \ep projects
bind \ed sqledger
bind \en pgnotes
bind \em systemd-tui-monitor

bind -M insert \eo last_out
bind -M insert \ep projects
bind -M insert \ed sqledger
bind -M insert \en pgnotes
bind -M insert \em systemd-tui-monitor

fzf --fish | source

# uv
fish_add_path "/home/saltchicken/.local/share/../bin"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/saltchicken/.ghcup/bin $PATH # ghcup-env