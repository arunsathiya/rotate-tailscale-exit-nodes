#!/bin/bash

TAILSCALE_BIN="/Applications/Tailscale.app/Contents/MacOS/Tailscale" 

# Get list of hostnames 
# - Run Tailscale exit-node list command and filter for USA
# - Pipe to awk to print just the 2nd column (hostname)
# - Grep to remove header line with 'HOSTNAME'
# - Grep for any non-empty lines
# - Capture output into hostnames array
hostnames=(
  $($TAILSCALE_BIN exit-node list -filter USA | 
    awk '{print $2}' |  
    grep -v 'HOSTNAME\\|To' |
    grep .
  )
)

# Select random hostname
# - Generate random number with $RANDOM
# - Modulo by size of hostnames array for random index  
# - Index into hostnames array with random index
# - Assign to random_hostname variable
random_hostname=${hostnames[$RANDOM % ${#hostnames[@]}]} 

# Set as exit node 
# - Run Tailscale set command
# - Pass --exit-node with random hostname
$TAILSCALE_BIN set \
  --exit-node=$random_hostname

# Successful exit
exit 0