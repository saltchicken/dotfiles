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

fzf --fish | source
