#!/bin/sh

# Set the initial value of DDNS_UPDATE_STATUS to 0
DDNS_UPDATE_STATUS=0

# Set the path to the configuration file
CONFIG_FILE=$(dirname $0)/.ddns_confidential

# Check if the configuration file is readable and source it
if [ -r "$CONFIG_FILE" ]; then
    . "$CONFIG_FILE"

    # Retrieve the current public IP address using curl
    MY_IP=$(curl --silent ipecho.net/plain)

    # Send an update request to Infomaniak with the new IP address and check the response
    RESPONSE=$(curl -s "https://infomaniak.com/nic/update?hostname=${DNS_TOPDOMAIN_NAME}&myip=${MY_IP}&username=${DDNS_USERNAME}&password=${DDNS_PASSWORD}")

    # Check if the curl command was successful and if the response matches '^good|^nochg'
    if [ $? -eq 0 ] && echo "$RESPONSE" | grep -qE '^good|^nochg'; then
        # Update was successful, set DDNS_UPDATE_STATUS to 1
        DDNS_UPDATE_STATUS=1
    fi
fi

# Call ddns_custom_updated with the value of DDNS_UPDATE_STATUS
/sbin/ddns_custom_updated $DDNS_UPDATE_STATUS

# Print debug information if DEBUG is set to 1
if [ "$DEBUG" -gt 0 ]; then
    echo "DEBUG: DDNS_UPDATE_STATUS='${DDNS_UPDATE_STATUS}'"
fi