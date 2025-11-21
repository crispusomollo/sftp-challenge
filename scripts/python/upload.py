#!/usr/bin/env python3
"""Upload a file to an SFTP server using paramiko.

Usage: python3 upload.py local_file remote_path
"""
import sys
import paramiko

HOST = "your.server.com"
PORT = 22
USER = "username"
PASSWORD = None  # or set a password
KEY_FILENAME = None  # or path to private key

if len(sys.argv) < 3:
    print("Usage: upload.py local_file remote_path")
    sys.exit(1)

local = sys.argv[1]
remote = sys.argv[2]

t = paramiko.Transport((HOST, PORT))
if KEY_FILENAME:
    pkey = paramiko.RSAKey.from_private_key_file(KEY_FILENAME)
    t.connect(username=USER, pkey=pkey)
else:
    t.connect(username=USER, password=PASSWORD)
sftp = paramiko.SFTPClient.from_transport(t)
sftp.put(local, remote)
sftp.close()
t.close()
print(f'Uploaded {local} -> {HOST}:{remote}')
