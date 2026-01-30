#!/bin/bash

# Configuration - CHANGE THESE
GITHUB_USER="SmilingBytes"
GITHUB_REPO="markdown-to-pdf"
SCRIPT_NAME="markdown-to-pdf.sh"
RAW_URL="https://raw.githubusercontent.com/$GITHUB_USER/$GITHUB_REPO/main/$SCRIPT_NAME"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Starting installation of markdown_to_pdf...${NC}"

# 1. Create directory
INSTALL_DIR="$HOME/.config/shell-functions"
mkdir -p "$INSTALL_DIR"

# 2. Download the script
echo -e "Downloading ${SCRIPT_NAME}..."
if curl -fsSL "$RAW_URL" -o "$INSTALL_DIR/$SCRIPT_NAME"; then
    chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
    echo -e "${GREEN}Successfully downloaded to $INSTALL_DIR${NC}"
else
    echo -e "${RED}Failed to download script. Please check your internet connection or URL.${NC}"
    exit 1
fi

# 3. Identify Shell and RC file
CURRENT_SHELL=$(basename "$SHELL")
RC_FILE=""

if [[ "$CURRENT_SHELL" == "zsh" ]]; then
    RC_FILE="$HOME/.zshrc"
    SOURCE_BLOCK="
# Source custom shell functions
if [[ -d \"$INSTALL_DIR\" ]]; then
    for f in \"$INSTALL_DIR\"/*.sh(N); do
        source \"\$f\"
    done
fi"
elif [[ "$CURRENT_SHELL" == "bash" ]]; then
    RC_FILE="$HOME/.bashrc"
    SOURCE_BLOCK="
# Source custom shell functions
if [[ -d \"$INSTALL_DIR\" ]]; then
    for f in \"$INSTALL_DIR\"/*.sh; do
        [[ -e \"\$f\" ]] && source \"\$f\"
    done
fi"
else
    echo -e "${RED}Unsupported shell: $CURRENT_SHELL. Please manually source $INSTALL_DIR/$SCRIPT_NAME${NC}"
    exit 0
fi

# 4. Add to RC file if not already there
if [[ -f "$RC_FILE" ]]; then
    if ! grep -q "shell-functions" "$RC_FILE"; then
        echo -e "Adding sourcing logic to ${RC_FILE}..."
        echo "$SOURCE_BLOCK" >> "$RC_FILE"
        echo -e "${GREEN}Installation complete!${NC}"
        echo -e "Please run: ${BLUE}source $RC_FILE${NC}"
    else
        echo -e "${BLUE}Sourcing logic already exists in $RC_FILE. Updating file...${NC}"
        # Optional: update the script in place if needed
    fi
else
    echo -e "${RED}Config file $RC_FILE not found.${NC}"
fi
