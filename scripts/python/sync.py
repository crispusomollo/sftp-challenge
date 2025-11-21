#!/usr/bin/env python3
"""Simple upload-sync of files in a local folder to a remote folder via SFTP."""
import os
import paramiko

HOST = "your.server.com"
PORT = 22
USER = "username"
PASSWORD = None
KEY_FILENAME = None

LOCAL_FOLDER = "./local"
REMOTE_FOLDER = "/remote"

t = paramiko.Transport((HOST, PORT))
if KEY_FILENAME:
    pkey = paramiko.RSAKey.from_private_key_file(KEY_FILENAME)
    t.connect(username=USER, pkey=pkey)
else:
    t.connect(username=USER, password=PASSWORD)
sftp = paramiko.SFTPClient.from_transport(t)

for fname in os.listdir(LOCAL_FOLDER):
    local_path = os.path.join(LOCAL_FOLDER, fname)
    remote_path = REMOTE_FOLDER.rstrip('/') + '/' + fname
    if os.path.isfile(local_path):
        sftp.put(local_path, remote_path)
        print(f'Uploaded {local_path} -> {remote_path}')

sftp.close()
t.close()
