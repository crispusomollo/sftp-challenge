#!/usr/bin/env bash
set -euo pipefail

# Usage: ./download.sh remote_file local_path
HOST="${SFTP_HOST:-your.server.com}"
USER="${SFTP_USER:-username}"
PORT="${SFTP_PORT:-22}"
KEY="${SFTP_KEY:-}"

REMOTE_FILE="$1"
LOCAL_PATH="$2"

if [[ -n "$KEY" ]]; then
  sftp -oPort=$PORT -i "$KEY" "$USER@$HOST" <<EOF
get "$REMOTE_FILE" "$LOCAL_PATH"
EOF
else
  sftp -oPort=$PORT "$USER@$HOST" <<EOF
get "$REMOTE_FILE" "$LOCAL_PATH"
EOF
fi
echo "Downloaded $REMOTE_FILE to $LOCAL_PATH"
