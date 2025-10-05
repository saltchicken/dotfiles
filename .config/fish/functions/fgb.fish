# Bring a background job to the foreground using fzf
function fgb
    # Pipe jobs to fzf and store the selection
    set -l job_line (jobs | fzf --height 40% --reverse)

    # Exit if nothing was selected
    if test -z "$job_line"
        return
    end

    # Extract just the job number from the selection
    set -l job_id (string match -r '\d+' -- (string split -n -m1 ' ' -- "$job_line"))

    # Bring the job to the foreground if an ID was found
    if test -n "$job_id"
        fg %$job_id
    end
end
