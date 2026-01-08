#!/bin/bash
# Backhaul Script for Managed Servers (PEP 668) - github.com/hossein-m18

# Install prerequisites
sudo apt update -y
sudo apt install -y python3 python3-pip python3-venv curl wget unzip tar

# Setup virtual environment
python3 -m venv /tmp/backhaul_env
source /tmp/backhaul_env/bin/activate

# Install Python packages
pip install --upgrade pip
pip install netifaces colorama requests

# Download and run backhaul script
curl -fsSL https://raw.githubusercontent.com/hossein-m18/Backhaul_script/refs/heads/main/backhaul.py -o /tmp/backhaul.py
python3 /tmp/backhaul.py

deactivate
