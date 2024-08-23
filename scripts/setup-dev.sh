#!/bin/bash

bash ~/dot_jake/scripts/setup.sh 0

# APT
sudo apt install -y build-essential curl git python-is-python3 python3-pip python3-venv make zsh tmux bat exa ncdu httpie ripgrep fd-find duf 

# SNAP
sudo snap install procs neovim

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# starship
curl -sS https://starship.rs/install.sh | sh

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source $HOME/.zshrc
nvm install --lts
nvm use default

# pyenv
curl https://pyenv.run | bash

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.zshrc

# tokei
cargo install tokei

# teelder
cargo install tealdeer

# bottom
cargo install bottom --locked


# reload
source $HOME/.zshrc
