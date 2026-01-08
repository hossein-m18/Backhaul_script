#!/bin/bash
# Backhaul Script - github.com/hossein-m18

# Install all prerequisites
sudo apt update -y
sudo apt install -y python3 python3-pip curl wget unzip tar

# Install Python packages (with fallback for different systems)
pip3 install --upgrade pip 2>/dev/null || python3 -m pip install --upgrade pip
pip3 install --break-system-packages netifaces colorama requests 2>/dev/null || \
pip3 install netifaces colorama requests 2>/dev/null || \
python3 -m pip install netifaces colorama requests

# Download and run backhaul script
curl -fsSL https://raw.githubusercontent.com/hossein-m18/Backhaul_script/refs/heads/main/backhaul.py -o /tmp/backhaul.py
python3 /tmp/backhaul.py
