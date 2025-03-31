#!/bin/bash

set -e

# === Install Zsh ===
echo "Installing Zsh..."
sudo apt update && sudo apt install -y zsh curl git

# === Install Oh My Zsh (unattended) ===
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# === Symlink Zsh config files ===
echo "Linking .zshrc and .zsh_aliases..."
ln -sf "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/.dotfiles/zsh/.zsh_aliases" "$HOME/.zsh_aliases"

# === Symlink Oh My Zsh custom theme ===
echo "Linking custom zsh theme..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
mkdir -p "$ZSH_CUSTOM/themes"
ln -sf "$HOME/.dotfiles/my.zsh-theme" "$ZSH_CUSTOM/themes/my.zsh-theme"

# === Set Zsh as default shell ===
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Setting Zsh as default shell..."
  chsh -s "$(which zsh)"
fi

# === Install Zsh plugins ===
echo "Installing zsh-autosuggestions and zsh-syntax-highlighting..."
mkdir -p "$ZSH_CUSTOM/plugins"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# === Symlink Neovim config ===
echo "Linking Neovim config..."
mkdir -p "$HOME/.config/nvim"
ln -sf "$HOME/.dotfiles/init.vim" "$HOME/.config/nvim/init.vim"

echo "✅ Dotfiles setup complete. Restart your terminal to apply changes."

