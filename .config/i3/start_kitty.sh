#!/bin/bash

while ! pgrep tmux >/dev/null; do
  sleep 0.1
done

tmux a -t home
