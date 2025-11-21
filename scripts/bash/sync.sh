#!/usr/bin/env bash
set -euo pipefail

# Usage: ./sync.sh [local_dir] [remote_dir]
LOCAL_DIR="${1:-./local}"
REMOTE_DIR="${2:-/remote}"
HOST="${SFTP_HOST:-your.server.com}"
USER="${SFTP_USER:-username}"
PORT="${SFTP_PORT:-22}"
KEY="${SFTP_KEY:-}"

# Use rsync over ssh for efficient syncing
if [[ -n "$KEY" ]]; then
  RSYNC_RSH="ssh -i $KEY -p $PORT"
else
  RSYNC_RSH="ssh -p $PORT"
fi

rsync -avz -e "$RSYNC_RSH" "$LOCAL_DIR/" "$USER@$HOST:$REMOTE_DIR/"
echo "Synced $LOCAL_DIR -> $USER@$HOST:$REMOTE_DIR"
