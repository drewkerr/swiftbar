#!/bin/bash
# <bitbar.title>Hide Menu Icons</bitbar.title>
# <bitbar.version>v1</bitbar.version>
# <bitbar.author>Andrew Kerr</bitbar.author>
# <bitbar.author.github>drewkerr</bitbar.author.github>
# <bitbar.desc>Hide Menu bar icons to the left. Click to toggle visibility.</bitbar.desc>
# <bitbar.dependencies>bash</bitbar.dependencies>

opt="bash='$0' param1=click terminal=false refresh=true"
cmd="swiftbar://toggleplugin?name=hidehelper"

if defaults read com.ameba.SwiftBar DisabledPlugins | grep hidehelper >/dev/null; then
  if [[ "$1" ]]; then
    
    pos=$(defaults read com.ameba.SwiftBar "NSStatusItem Preferred Position hide.sh")
    defaults write com.ameba.SwiftBar "NSStatusItem Preferred Position hidehelper.sh" -int $(($pos+1))
    open -g $cmd
  #else
    #echo ":chevron.right: | $opt"
  fi
else
  if [[ "$1" ]]; then
    open -g $cmd
  #else
    #echo ":chevron.left: | $opt"
  fi
fi
echo ":ellipsis: | $opt"