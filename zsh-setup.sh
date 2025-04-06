#!/bin/bash

# Update and install zsh
echo "Installing Zsh..."
sudo apt update && sudo apt install -y zsh curl git

# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh..."
export RUNZSH=no  # Prevent auto-launch
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set Zsh as the default shell
chsh -s $(which zsh)

# Clone plugins
echo "Installing plugins..."
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Modify .zshrc to include plugins
echo "Updating .zshrc with plugins..."
sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Source .zshrc
echo "Sourcing ~/.zshrc..."
source ~/.zshrc

echo "All done! Restart your terminal or run 'zsh' to switch."
