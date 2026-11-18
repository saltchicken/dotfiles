function archon-monitor --description "Monitor the latest model payload sent by Archon"
    argparse 'm/mode=' o/once w/wait 'f/file=' h/help -- $argv
    or return 1

    if set -q _flag_help
        echo "Usage: archon-monitor [OPTIONS] [MODE]"
        echo ""
        echo "Modes (default: transcript):"
        echo "  transcript, t   Readable text view with unescaped newlines, tool calls & summaries"
        echo "  clean, c        Colorized JSON with tool schemas reduced to names and Base64 stripped"
        echo "  system, s       System prompt content only (with unescaped newlines)"
        echo "  raw, r          Full unmodified JSON payload"
        echo ""
        echo "Options:"
        echo "  -m, --mode MODE   Specify view mode (or pass as first positional argument)"
        echo "  -o, --once        Print the most recent payload from the log and exit"
        echo "  -w, --wait        Wait for the next payload instead of showing the last one immediately"
        echo "  -f, --file PATH   Custom path to archon.log"
        echo "  -h, --help        Show this help message"
        return 0
    end

    set -l log_file ~/.local/share/archon/sessions/logs/archon.log
    if set -q _flag_file
        set log_file $_flag_file
    end

    set -l mode transcript
    if set -q _flag_mode
        set mode $_flag_mode
    else if set -q argv[1]
        set mode $argv[1]
    end

    set -l jq_args
    set -l jq_filter

    switch $mode
        case raw r full
            set jq_args -C
            set jq_filter '.'

        case clean c stripped json
            set jq_args -C
            set jq_filter '
              if .tools then
                .tools |= map(.function.name? // .functionDeclarations[]?.name)
              else . end
              | if .messages then
                  .messages |= map(
                    if .images then .images |= map("[base64_image: \(length) chars]") else . end
                  )
                else . end
              | if .contents then
                  .contents |= map(
                    .parts |= map(
                      if .inlineData then .inlineData.data |= "[base64_image: \(length) chars]" else . end
                    )
                  )
                else . end
            '

        case system sys s
            set jq_args -r
            set jq_filter '
              (.messages[]? | select(.role == "system") | .content)
              // .systemInstruction.parts[0].text
              // "(No system message in payload)"
            '

        case transcript text t
            set jq_args -r
            set jq_filter '
              if .messages then
                "=== OLLAMA (\(.model) | ctx: \(.options.num_ctx)) ===" +
                (if .tools then "\nTools (\(.tools | length)): \([.tools[].function.name] | join(", "))" else "" end) + "\n",
                (.messages[] |
                  "━━ [\(.role | ascii_upcase)]" +
                  (if .images then " [+\(.images | length) image(s)]" else "" end) + " ━━\n" +
                  (if (.content // "") != "" then "\(.content)\n" else "" end) +
                  (if .tool_calls then (.tool_calls | map("⚙ Tool Call: \(.function.name)(\(.function.arguments | tostring))") | join("\n")) + "\n" else "" end)
                )
              else
                "=== GEMINI ===" +
                (if .tools then "\nTools (\(.tools[0].functionDeclarations | length)): \([.tools[0].functionDeclarations[].name] | join(", "))" else "" end) + "\n",
                (if .systemInstruction then
                  "━━ [SYSTEM] ━━\n\(.systemInstruction.parts[0].text)\n"
                else empty end),
                (.contents[] |
                  "━━ [\(.role | ascii_upcase)] ━━\n" +
                  (.parts | map(
                    if .thought then "💭 [THOUGHT]: \(.text // "")"
                    elif .text then .text
                    elif .inlineData then "🖼 [IMAGE: \(.inlineData.mimeType), \(.inlineData.data | length) b64 chars]"
                    elif .functionCall then "⚙ Tool Call: \(.functionCall.name)(\(.functionCall.args | tostring))"
                    elif .functionResponse then "🔧 Tool Output [\(.functionResponse.name)]:\n\(.functionResponse.response.output)"
                    else "" end
                  ) | join("\n")) + "\n"
                )
              end
            '

        case '*'
            echo "Unknown mode '$mode'. Valid modes: transcript (t), clean (c), system (s), raw (r)" >&2
            return 1
    end

    if not test -f "$log_file"
        echo "Log file not found at $log_file" >&2
        echo "Make sure Archon has been run with: RUST_LOG=archon=debug" >&2
        return 1
    end

    # One-shot mode: print the latest payload and exit
    if set -q _flag_once
        grep "Payload: " "$log_file" | tail -n 1 | sed 's/.*Payload: //' | jq $jq_args "$jq_filter"
        return $status
    end

    # Show the most recent payload immediately on startup unless --wait is set
    if not set -q _flag_wait
        set -l last_payload (grep "Payload: " "$log_file" | tail -n 1 | sed 's/.*Payload: //')
        if test -n "$last_payload"
            clear
            printf '%s\n' "$last_payload" | jq $jq_args "$jq_filter"
        else
            clear
            echo "Waiting for first payload in $log_file (ensure RUST_LOG=archon=debug is set)..."
        end
    end

    # Follow new payloads and overwrite the terminal on each update
    tail -n 0 -f "$log_file" | sed -u -n 's/.*Payload: //p' | while read -l line
        clear
        printf '%s\n' "$line" | jq $jq_args "$jq_filter"
    end
end
