#!/bin/bash
# <bitbar.title>Caffeinate</bitbar.title>
# <bitbar.version>v1</bitbar.version>
# <bitbar.author>Andrew Kerr</bitbar.author>
# <bitbar.author.github>drewkerr</bitbar.author.github>
# <bitbar.desc>Prevent display sleep using the system command 'caffeinate'. Click to toggle on/off.</bitbar.desc>
# <bitbar.dependencies>bash</bitbar.dependencies>

opt="bash='$0' param1=click terminal=false refresh=true"

if pgrep -q caffeinate; then
  echo ":cup.and.saucer.fill: | $opt"
  if [[ "$1" ]]; then
    /usr/bin/killall caffeinate
  fi
else
  echo ":cup.and.saucer: | $opt"
  if [[ "$1" ]]; then
    nohup /usr/bin/caffeinate -di &> /dev/null &
  fi
fi