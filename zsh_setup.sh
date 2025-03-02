#!/bin/bash

# Install Zsh
sudo apt update && sudo apt install zsh -y

# Overwrite .zshrc
cp ~/.dotfiles/zsh/.zshrc ~/

# Install Oh My Zsh
if ! command -v curl &> /dev/null && ! command -v wget &> /dev/null; then
    sudo apt install curl -y
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Make Zsh default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    sudo chsh -s "$(which zsh)" "$USER"
fi

# Install autocomplete plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git \
      "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Create symlink for aliases
if [ ! -d "$HOME/.dotfiles/zsh" ]; then
    echo "Error: .dotfiles/zsh directory not found!" >&2
    exit 1
fi

ln -sf "$HOME/.dotfiles/zsh/.zsh_aliases" "$HOME/.zsh_aliases"

# Add source to .zshrc
if ! grep -q "source ~/.zsh_aliases" "$HOME/.zshrc"; then
    echo -e "\n# Load custom aliases\nsource ~/.zsh_aliases" >> "$HOME/.zshrc"
fi

echo "Setup complete! You may need to log out and back in for changes to take effect."
