#!/bin/bash
# Backhaul Script Installer for Externally Managed Servers (PEP 668)
# Uses virtual environment to avoid system package conflicts
# Author: github.com/hossein-m18

set -e

echo "Installing prerequisites..."
sudo apt update
sudo apt install -y python3 python3-pip python3-venv curl

# Create and activate virtual environment
VENV_DIR="/tmp/backhaul_venv"
echo "Setting up virtual environment at $VENV_DIR..."
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

# Upgrade pip and install required packages
pip install --upgrade pip
pip install netifaces colorama requests

# Download logo script
curl -fsSL https://raw.githubusercontent.com/hossein-m18/Backhaul_script/refs/heads/main/logo.sh -o /etc/logo2.sh

# Download and run backhaul.py
echo "Downloading and running backhaul script..."
curl -fsSL https://raw.githubusercontent.com/hossein-m18/Backhaul_script/refs/heads/main/backhaul.py | python3

# Deactivate virtual environment
deactivate
