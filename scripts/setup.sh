#!/bin/bash

set -e

echo "Starting dotfiles setup..."

# === Install Oh My Zsh (unattended) ===
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# === Symlink Zsh config files ===
echo "Linking .zshrc and .zsh_aliases..."
ln -sf "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/.dotfiles/zsh/.zsh_aliases" "$HOME/.zsh_aliases"

# === Symlink custom theme ===
echo "Linking custom zsh theme..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
mkdir -p "$ZSH_CUSTOM/themes"
ln -sf "$HOME/.dotfiles/zsh/my.zsh-theme" "$ZSH_CUSTOM/themes/my.zsh-theme"

# === Set Zsh as default shell ===
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Setting Zsh as default shell..."
  chsh -s "$(which zsh)"
fi

# === Zsh plugins ===
echo "Installing Zsh plugins..."
mkdir -p "$ZSH_CUSTOM/plugins"

[[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]] && \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

[[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]] && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

[[ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]] && \
  git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions"

# === Neovim and LazyVim setup ===
echo "Setting up LazyVim for Neovim..."

# Remove the current Neovim configuration directory (optional, if you want to completely replace it)
rm -rf "$HOME/.config/nvim"

# Clone LazyVim's configuration repository
git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"

# === Docker group setup ===
echo "Adding user to docker group..."
sudo groupadd docker 2>/dev/null || true
sudo usermod -aG docker "$(whoami)"
echo "You may need to log out and back in for Docker group changes to take effect."

echo "Dotfiles setup complete. Restart your terminal to apply changes."

