#!/bin/bash

LAST=""
LAST_LAST=""
nc -k -nvlp 31373 2>&1 | \
while read LINE
do
    if [[ "$LINE" =~ ^\[i\].* ]]; then
        if ! [[ "$LINE" =~ ^\[i\].Attempting.* ]]; then
            echo $LINE
        fi
    fi
    if [[ "$LINE" =~ ^Connection.received.on.*$ ]]; then
        if [[ "$LAST" =~ ^Connection.received.on.*$ ]]; then
            echo "$LAST_LAST" | sed 's/^\[i\] Attempting /  [+] Success: /'
        fi
    fi
    if [[ "$LINE" =~ ^\[i\].Ending.Reverse.Shell.Audit.*$ ]]; then
        NC_PID=$(pgrep nc | tail -n 1)
        kill $NC_PID
    fi
    LAST_LAST="$LAST"
    LAST="$LINE"
done
