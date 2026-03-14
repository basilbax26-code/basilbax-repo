#!/bin/bash

# Multi-Program Installer Script
# Installs: Homebrew, Tailscale, VS Code, Chrome, Sublime Text, Telegram
# For macOS only

set -e

echo "=========================================="
echo "Multi-Program Installer for macOS"
echo "=========================================="
echo ""

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# ============================================
# Step 1: Install Homebrew
# ============================================
echo "Step 1: Checking Homebrew installation..."
echo "-------------------------------------------"

if command_exists brew; then
    echo "Homebrew is already installed:"
    brew --version
    echo ""
else
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH
    if [[ $(uname -m) == 'arm64' ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    echo "Homebrew installed successfully!"
fi
echo ""

# Ensure Homebrew is in PATH for the rest of the script
if [[ $(uname -m) == 'arm64' ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
else
    export PATH="/usr/local/bin:$PATH"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update
echo ""

# ============================================
# Step 2: Install Tailscale
# ============================================
echo "Step 2: Installing Tailscale..."
echo "-------------------------------------------"
if command_exists tailscale; then
    echo "Tailscale is already installed!"
    tailscale --version
else
    brew install tailscale
    echo "Tailscale installed successfully!"
fi
echo ""

# ============================================
# Step 3: Install Visual Studio Code
# ============================================
echo "Step 3: Installing Visual Studio Code..."
echo "-------------------------------------------"
if command_exists code; then
    echo "Visual Studio Code is already installed!"
    code --version
else
    brew install --cask visual-studio-code
    echo "Visual Studio Code installed successfully!"
fi
echo ""

# ============================================
# Step 4: Install Google Chrome
# ============================================
echo "Step 4: Installing Google Chrome..."
echo "-------------------------------------------"
# Check if Chrome is installed by looking for the app
if [[ -d "/Applications/Google Chrome.app" ]]; then
    echo "Google Chrome is already installed!"
else
    brew install --cask google-chrome
    echo "Google Chrome installed successfully!"
fi
echo ""

# ============================================
# Step 5: Install Sublime Text
# ============================================
echo "Step 5: Installing Sublime Text..."
echo "-------------------------------------------"
if command_exists subl; then
    echo "Sublime Text is already installed!"
    subl --version
else
    brew install --cask sublime-text
    echo "Sublime Text installed successfully!"
fi
echo ""

# ============================================
# Step 6: Install Telegram
# ============================================
echo "Step 6: Installing Telegram..."
echo "-------------------------------------------"
# Check if Telegram is installed by looking for the app
if [[ -d "/Applications/Telegram Desktop.app" ]] || [[ -d "/Applications/Telegram.app" ]]; then
    echo "Telegram is already installed!"
else
    brew install --cask telegram
    echo "Telegram installed successfully!"
fi
echo ""

# ============================================
# Summary
# ============================================
echo "=========================================="
echo "Installation Complete!"
echo "=========================================="
echo ""
echo "Installed Programs:"
echo "  ✓ Homebrew       - Package manager"
echo "  ✓ Tailscale      - VPN client"
echo "  ✓ Visual Studio Code - Code editor"
echo "  ✓ Google Chrome  - Web browser"
echo "  ✓ Sublime Text   - Code editor"
echo "  ✓ Telegram       - Messaging app"
echo ""
echo "To open installed applications, use Spotlight (Cmd+Space) or find them in /Applications"
echo ""
echo "To update all installed packages, run: brew update && brew upgrade"

