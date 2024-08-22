#!/bin/bash

sudo apt install -y build-essential curl git make zsh tmux bat exa ncdu httpie ripgrep fd-find duf 

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# procs
sudo snap install procs

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# tokei
cargo install tokei

# teelder
cargo install tealdeer

# bottom
cargo install bottom --locked
