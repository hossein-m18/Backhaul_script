#!/bin/bash
# Backhaul Script Installer
# Author: github.com/hossein-m18

set -e

echo "Installing prerequisites..."
sudo apt update
sudo apt install -y python3 python3-pip curl

# Function to install package with apt fallback to pip
install_python_package() {
    local apt_pkg="python3-$1"
    local pip_pkg="$1"
    
    # Try apt first
    if apt-cache show "$apt_pkg" &>/dev/null; then
        echo "Installing $apt_pkg via apt..."
        sudo apt install -y "$apt_pkg" 2>/dev/null || {
            echo "$apt_pkg not available via apt, trying pip..."
            pip3 install --break-system-packages "$pip_pkg" 2>/dev/null || pip3 install "$pip_pkg"
        }
    else
        echo "$apt_pkg not found in repositories, installing $pip_pkg via pip..."
        pip3 install --break-system-packages "$pip_pkg" 2>/dev/null || pip3 install "$pip_pkg"
    fi
}

# Install required Python packages
install_python_package "netifaces"
install_python_package "colorama"
install_python_package "requests"

# Download and run backhaul.py
echo "Downloading and running backhaul script..."
curl -fsSL https://raw.githubusercontent.com/hossein-m18/Backhaul_script/refs/heads/main/logo.sh -o /etc/logo2.sh
curl -fsSL https://raw.githubusercontent.com/hossein-m18/Backhaul_script/refs/heads/main/backhaul.py | python3
