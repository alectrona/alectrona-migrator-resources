#!/bin/bash

# Run Migrator from Jamf Pro
# Written by Ryan Ball at Alectrona

# A script to initiate a migration from Self Service using Jamf Pro.
# This script should be used within a Jamf Pro policy scoped to the destination Mac.

# Jamf Pro Parameters
license="$4"        # Your Alectrona Migrator license key
title="$5"          # The title used in dialogs, default is "Alectrona Migrator"
logo="$6"           # A URL of an image you'd like to display in dialogs

# Variables
migratorCLT="/usr/local/bin/migrator"
exitCode="0"
args=()
[[ -n "$license" ]] && args+=("--license $license")
[[ -n "$title" ]] && args+=("--title $title")
[[ -n "$logo" ]] && args+=("--logo $logo")

# Run the migrator command line tool
if [[ ! -e "$migratorCLT" ]]; then
    echo "migrator does not exist on this Mac, exiting."
    exitCode="1"
else
    eval "$migratorCLT" "${args[*]}"
    exitCode="$?"
fi

exit "$exitCode"