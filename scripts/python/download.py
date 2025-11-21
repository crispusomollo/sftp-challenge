#!/usr/bin/env python3
"""Download a file from an SFTP server using paramiko.

Usage: python3 download.py remote_file local_path
"""
import sys
import paramiko

HOST = "your.server.com"
PORT = 22
USER = "username"
PASSWORD = None
KEY_FILENAME = None

if len(sys.argv) < 3:
    print("Usage: download.py remote_file local_path")
    sys.exit(1)

remote = sys.argv[1]
local = sys.argv[2]

t = paramiko.Transport((HOST, PORT))
if KEY_FILENAME:
    pkey = paramiko.RSAKey.from_private_key_file(KEY_FILENAME)
    t.connect(username=USER, pkey=pkey)
else:
    t.connect(username=USER, password=PASSWORD)
sftp = paramiko.SFTPClient.from_transport(t)
sftp.get(remote, local)
sftp.close()
t.close()
print(f'Downloaded {HOST}:{remote} -> {local}')
