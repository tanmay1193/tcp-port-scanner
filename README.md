# 🔍 Simple TCP Port Scanner (Bash + Netcat)

A lightweight TCP port scanner written in Bash using `nc` (`netcat`). Scans a range of TCP ports on a given host and prints which ports are open or closed.

## 🛠 Requirements
- Bash
- `nc` (netcat)
- Works on Linux/macOS/WSL

## 🚀 Usage

```bash
chmod +x port_scanner.sh
./port_scanner.sh <host> <start_port> <end_port>
