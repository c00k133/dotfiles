#!/usr/bin/env bash

MULLVAD_STATUS="$(mullvad status)"

if echo "$MULLVAD_STATUS" | grep --quiet 'Connected'; then
    echo 'VPN ✓'
elif echo "$MULLVAD_STATUS" | grep --quiet 'Connecting'; then
    echo 'VPN …'
else
    echo 'VPN x'
fi
