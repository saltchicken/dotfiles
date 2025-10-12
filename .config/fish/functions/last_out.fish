function last_out --wraps='nvim (kitty @ get-text --extent last_non_empty_output | psub)' --description 'alias last_out nvim (kitty @ get-text --extent last_non_empty_output | psub)'
    nvim (kitty @ get-text --extent last_non_empty_output | psub) $argv
end
