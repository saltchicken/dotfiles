current_config=$(ps -ef | grep "picom --config" | grep -v grep | awk -F'/' '{print $NF}' | cut -d'.' -f1)

echo $current_config

if [[ "$current_config" == "transparency" ]]; then
  killall picom
  sleep 0.1
  picom --config ~/.config/picom/notransparency.conf &

elif [[ "$current_config" == "notransparency" ]]; then
  killall picom
  sleep 0.1
  picom --config ~/.config/picom/transparency.conf &
else
  echo "Didn't find valid picom process"
fi
