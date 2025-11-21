#!/usr/bin/env bash
set -euo pipefail

# Usage: ./upload.sh local_file remote_path
HOST="${SFTP_HOST:-your.server.com}"
USER="${SFTP_USER:-username}"
PORT="${SFTP_PORT:-22}"
KEY="${SFTP_KEY:-}"

LOCAL_FILE="$1"
REMOTE_PATH="$2"

if [[ -n "$KEY" ]]; then
  sftp -oPort=$PORT -i "$KEY" "$USER@$HOST" <<EOF
put "$LOCAL_FILE" "$REMOTE_PATH"
EOF
else
  sftp -oPort=$PORT "$USER@$HOST" <<EOF
put "$LOCAL_FILE" "$REMOTE_PATH"
EOF
fi
echo "Uploaded $LOCAL_FILE to $USER@$HOST:$REMOTE_PATH"
