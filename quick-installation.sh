#!/bin/bash

clear
echo -e "\033[1;32m
██████╗ ██╗   ██╗██████╗ ██████╗ ██████╗ ██████╗  █████╗ 
██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗╚════██╗██╔══██╗
██████╔╝ ╚████╔╝ ██║  ██║██║  ██║██║  ██║ █████╔╝╚██████║
██╔══██╗  ╚██╔╝  ██║  ██║██║  ██║██║  ██║██╔═══╝  ╚═══██║
██║  ██║   ██║   ██████╔╝██████╔╝██████╔╝███████╗ █████╔╝
╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚════╝ 
\033[0m"
echo -e "\033[1;34m==================================================\033[1;34m"
echo -e "\033[1;34m@Ryddd29 | Testnet, Node Runer, Developer, Retrodrop\033[1;34m"

sleep 4

# Update package
echo -e "\033[1;32mUpdate & Upgrade package...\033[0m"
sudo apt update && sudo apt upgrade -y
sudo apt install git -y

# Prompt to ask user if they want to install Node.js
read -p "Do you want to install nodejs? (y/n) [default: y]: " USER_INPUT

# Default to "y" if no input provided
USER_INPUT=${USER_INPUT:-y}

if [[ "$USER_INPUT" =~ ^[Yy]$ ]]; then
  echo -e "\033[0;32mInstall Node.js via nvm-list...\033[0m"

  # Install NVM (Node Version Manager)
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  # Load NVM into the current shell session
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

  # List available Node.js versions
  nvm list-remote

  # Ask the user to select a Node.js version to install
  read -p "Select your Node.js version: " NODEJS_USER

  # Install the selected version
  if [[ -n "$NODEJS_USER" ]]; then
    nvm install "$NODEJS_USER"
    echo -e "\033[0;32mNode.js version $NODEJS_USER successfully installed.\033[0m"
  else
    echo -e "\033[0;31mNo version selected. Installation aborted.\033[0m"
  fi
else
  echo -e "\033[0;33mInstallation skipped by user.\033[0m"
fi

# Clone github repository
echo -e "\033[0;32mClone github repository...\033[0m"
git clone https://github.com/ryzwan29/unich.git
cd unich

# Install dependencies
echo -e "\033[0;32mInstalling requirements dependencies...\033[0m"
npm install
