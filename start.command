#!/bin/bash
# Double-click this file to put the cake invoice online for this house.
# Close the Terminal window (or press Ctrl-C) to stop it.

cd "$(dirname "$0")" || exit 1

PORT=8420

# The Bonjour name works from this Mac and from any phone on the same
# wifi, and it survives the router handing out a different IP — so the
# saved business details keep belonging to the same address.
HOST_NAME=$(scutil --get LocalHostName 2>/dev/null)
if [ -n "$HOST_NAME" ]; then
  URL="http://$HOST_NAME.local:$PORT"
else
  URL="http://localhost:$PORT"
fi

if lsof -nP -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  echo "The invoice is already running. Opening it now."
  open "$URL"
  exit 0
fi

printf '\n  \033[1mCake invoice\033[0m\n\n'
printf '  Open this on any device on the wifi:\n\n'
printf '      \033[1m%s\033[0m\n\n' "$URL"
printf '  Leave this window open while you use it.\n'
printf '  Press Ctrl-C or close the window to stop.\n\n'

python3 -m http.server "$PORT" --bind 0.0.0.0 >/dev/null 2>&1 &
SERVER_PID=$!

trap 'kill $SERVER_PID 2>/dev/null; printf "\n  Stopped.\n\n"; exit 0' INT TERM

sleep 1
open "$URL"

wait $SERVER_PID
