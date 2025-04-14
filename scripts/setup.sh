
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

