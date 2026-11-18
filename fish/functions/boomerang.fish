function boomerang --description 'Create a forward-reverse boomerang of a video'
    if test (count $argv) -lt 1
        echo "Usage: boomerang <input_file>"
        return 1
    end

    set input_file $argv[1]

    # Grab the extension (e.g., .mp4)
    set ext (path extension $input_file)

    # Strip the extension from the input path (e.g., my_video)
    set base (path change-extension '' $input_file)

    # Safely stitch the string together without curly braces
    set output_file (string join "" $base "_boomerang" $ext)

    echo "Generating $output_file..."

    ffmpeg -i $input_file -filter_complex "[0:v]reverse[r];[0:v][r]concat=n=2:v=1[outv]" -map "[outv]" $output_file
end
