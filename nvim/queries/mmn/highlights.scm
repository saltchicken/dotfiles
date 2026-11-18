; Directives & Comments
(comment) @comment

[
  "#BPM="
  "#SIG="
  "#QUANTIZE="
  "#SCALE="
  "#SCALE_SEQ="
  "#SILENCE"
  "#INCLUDE"
] @keyword.directive

; Definitions & References
(alias_def "let" @keyword (identifier) @variable)
(alias_ref (identifier) @variable)

; Tracks
(track_def "!" @error) ; Mute symbol
(track_def "T" @keyword (int) @number)

(track_modifier) @parameter

; Primitives
(pitch_val) @string.special
(int) @number
(float) @number
(string) @string

; Keywords & Grouping Constructs
[
  "with"
  "scale"
  "midi"
  "shift"
  "circle_of_fifths"
] @keyword

; Method Chaining & Builtins
[
  "euclid" "E" 
  "arp" 
  "stut" 
  "humanize" 
  "speed"
  "vel" "v" 
  "gate" "g"
  "cc" "CC"
] @function.method

; Dynamic LFOs
[
  "sine"
  "saw"
  "tri"
] @function.builtin

; Operators
[
  "/"
  "|"
  "+"
  "-"
  "="
  ":"
  "^"
  "@"
  "%"
  "."
  "'"
  "*"
] @operator

; Brackets
[
  "[" "]"
  "{" "}"
  "(" ")"
] @punctuation.bracket
