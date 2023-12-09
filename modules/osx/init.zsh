#
# Defines macOS aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'helper'

# Return if requirements are not found.
if ! is-darwin; then
  return 1
fi

#
# Aliases
#

# Changes directory to the current Finder directory.
alias cdf='cd "$(pfd)"'

# Pushes directory to the current Finder directory.
alias pushdf='pushd "$(pfd)"'

# Export http proxy to envar if set
export http_proxy=$(scutil --proxy | awk '\
  /HTTPEnable/ { enabled = $3; } \
  /HTTPProxy/ { server = $3; } \
  /HTTPPort/ { port = $3; } \
  END { if (enabled == "1") { print server ":" port; } }')

export https_proxy=$(scutil --proxy | awk '\
  /HTTPSEnable/ { enabled = $3; } \
  /HTTPSProxy/ { server = $3; } \
  /HTTPSPort/ { port = $3; } \
  END { if (enabled == "1") { print server ":" port; } }')

if [[ -n "$http_proxy" ]]; then
  print "http_proxy=$http_proxy"
else
  unset http_proxy
fi

if [[ -n "$https_proxy" ]]; then
  print "https_proxy=$https_proxy"
else
  unset https_proxy
fi
