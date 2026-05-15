#!/bin/bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
if [[ $# -lt 1 ]] || [[ ! -d $1 ]]; then
  echo "Usage:
	$0 <dir containing images>"
  exit 1
fi

# Kill any other scripts running
kill_others() {
  local mypid=$$ # capture this run's pid

  for pid in $( # cycle through all pids except this one
    pgrep -f randomisewallpaper.sh
  ); do
    [[ $pid -ne $mypid ]] && kill $pid # kill the other pids
    sleep 1                            # give time to complete
  done
}

kill_others

# This controls (in seconds) when to switch to the next image
INTERVAL=300

while true; do
  find "$1" |
    while read -r img; do
      echo "$((RANDOM % 1000)):$img"
    done |
    sort -n | cut -d':' -f2- |
    while read -r img; do
      #swaybg -o \* -i "$img" -m fill &
      awww img "$img"
      sleep $INTERVAL
    done
done
