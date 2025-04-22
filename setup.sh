#!/bin/bash
echo "[*] Updating packages..."
pkg update -y && pkg upgrade -y

echo "[*] Installing required tools..."
pkg install -y git python python2 nmap hydra curl wget openssh tsu
pkg install -y unstable-repo
pkg install -y bettercap

echo "[*] Cloning SQLMap and THC-Hydra..."
git clone https://github.com/sqlmapproject/sqlmap tools/sqlmap
git clone https://github.com/vanhauser-thc/thc-hydra tools/hydra

echo "[*] Setup complete. Run 'bash sprack_launcher.sh' to begin."
