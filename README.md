# SFTP Challenge

A cross-platform project demonstrating how to upload, download, and synchronize files
between a local machine and a remote server using SFTP.

This challenge includes:

- Multi-OS automation scripts (Bash, PowerShell, Python)
- Reusable configuration templates
- Example test files
- Systemd + cron automation samples
- Complete documentation in the `docs/` folder

---

## 🚀 Features

- Upload files to SFTP server
- Download files from SFTP server
- Bidirectional sync
- Password and SSH-key authentication
- Linux, Windows, and cross-platform Python support

---

## 📂 Project Structure

# SFTP Challenge

A cross-platform project demonstrating how to upload, download, and synchronize files
between a local machine and a remote server using SFTP.

This challenge includes:

- Multi-OS automation scripts (Bash, PowerShell, Python)
- Reusable configuration templates
- Example test files
- Systemd + cron automation samples
- Complete documentation in the `docs/` folder

---

## 🚀 Features

- Upload files to SFTP server
- Download files from SFTP server
- Bidirectional sync
- Password and SSH-key authentication
- Linux, Windows, and cross-platform Python support

---

## 📂 Project Structure

```
sftp-challenge/
│
├─ README.md
├─ LICENSE
├─ .gitignore
│
├─ docs/
├─ scripts/
├─ config/
├─ examples/
├─ tests/
└─ automation/
```

See each folder for more details.

---

## 🧰 Requirements

### Linux
- ssh
- sftp
- cron (optional)
- systemd (optional)

### Windows
- Windows PowerShell 5.1+ or PowerShell 7+
- WinSCP installed (optional)

### Python (cross-platform)
- Python 3.9+
- paramiko (`pip install paramiko`)

---

## 📘 Documentation

Full documentation is located in the `docs/` folder:
- `overview.md`
- `usage.md`
- `setup.md`
- `troubleshooting.md`

---

## 🏁 Quick Start

### Upload a file (Linux/macOS)
```bash
./scripts/bash/upload.sh local.txt /remote/path/
```

### Upload a file (Windows PowerShell)
```powershell
.\scripts\powershell\Upload-SFTP.ps1 -LocalFile "local.txt" -RemotePath "/remote/path/"
```

### Upload a file (Python)
```python
python3 scripts/python/upload.py local.txt /remote/path/
```

## 📄 License

MIT License — included in LICENSE.
