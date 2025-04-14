#!/bin/bash

set -e

echo "🔧 Updating packages and installing essential tools..."

# Update and install packages
sudo apt update
sudo apt install -y \
  zsh \
  curl \
  git \
  neovim \
  docker.io \
  docker-compose \
  build-essential \
  unzip \
  htop \
  wget \
  tmux \
  fzf \
  ranger \
  neofetch

echo "✅ Base packages (incl. tmux & fzf) installed."

