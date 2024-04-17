#!/bin/sh

PATTERN="$2"
FILE="$1"
CURRENT_TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S%z")

if [ "$PATTERN" = "date"  ]; then
    sed -i -E "s/^${PATTERN}:.+$/${PATTERN}: ${CURRENT_TIMESTAMP}/" "$FILE"
fi

sed -i -E "s/^lastMod:.+$/lastMod: ${CURRENT_TIMESTAMP}/" "$FILE"
