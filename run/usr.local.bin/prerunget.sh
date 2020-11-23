#!/bin/bash

# script to call multiple scripts in series to read and then write out values

# blocking script, will wait for valid ip address assigned to tun0/tap0 (port written to file /tmp/getvpnip)
source /usr/local/bin/getvpnip.sh

# blocking script, will wait for name resolution to be operational (will write to /tmp/dnsfailure if failure)
source /usr/local/bin/checkdns.sh www.google.com

# blocking script, will wait for external ip address retrieval (external ip written to file /tmp/getvpnextip)
source /usr/local/bin/getvpnextip.sh

# backgrounded script, will wait for vpn incoming port to be assigned (port written to file /tmp/getvpnport)
source /usr/local/bin/getvpnport.sh &
