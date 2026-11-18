function cncview -d "Generate and immediately view CNC pen gcode"
    set CNC_PATH "$HOME/Projects/cncpen/"
    set CAM_PATH "$HOME/Projects/cam/"

    # Capture the filename (first argument) and all subsequent flags
    set filename $argv[1]
    set extra_args $argv[2..-1]

    set tmp (mktemp --suffix=.nc)

    # Pass the filename and the extra flags to cncpen
    uv run --project $CNC_PATH cncpen $filename $extra_args -o $tmp

    if test $status -eq 0
        uv run --project $CAM_PATH cam $tmp --mode pen
    end

    rm -f $tmp
end
