#!/bin/bash

sudo apt install -y build-essential curl git make zsh tmux bat exa ncdu httpie ripgrep fd-find duf 

# procs
sudo snap install procs

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# starship
curl -sS https://starship.rs/install.sh | sh

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# tokei
cargo install tokei

# teelder
cargo install tealdeer

# bottom
cargo install bottom --locked


# reload
[ -f $HOME/.zshrc ] && source $HOME/.zshrc
