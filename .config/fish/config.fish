source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end

fish_vi_key_bindings

bind \co last_out
bind \cp projects
bind \cs sqledger
bind \cn pgnotes
bind \cy systemd-tui-monitor

bind -M insert \co last_out
bind -M insert \cp projects
bind -M insert \cs sqledger
bind -M insert \cn pgnotes
bind -M insert \cy systemd-tui-monitor

fzf --fish | source
