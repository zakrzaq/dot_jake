#!/bin/bash

echo "ubuntu - for Ubuntu"
echo "arch - for Arch based distros with YAY"
echo "mac - for MacOS"
echo ""
echo "Please choose OS:"
read system

if [[ "$system" =~ ^(ubuntu|arch|mac)$ ]]; then
  mkdir ~/dev
  mkdir ~/build-apps
else
    echo "$system in not supported"
fi


##### Ubuntu
if [ $system = 'ubuntu' ]
then
  # UPDATE SYSTEM
  
  sudo apt update && sudo apt upgrade -y
  
  # INSTALL GH cli
  
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y
  
  # INSTALL GIT
  
  sudo apt install git
  
  ssh-keygen -f git-hub-key -t ed25519 -C "j.zakrzewsky@gmail.com"
  gh ssh-key add ~/.ssh/git-hub-key.pub 
  
  # LINK CONFIG-DEV
  
  git clone git@github.com:zakrzaq/dot_jake.git ~/config-dev
  
  rm -rf ~/.config/nvim/*
  ln -sf ~/config-dev/nvim/* ~/.config/nvim/
  
  rm -rf ~/.tmux.conf
  ln -sf ~/config-dev/.tmux.conf ~/
  
  rm -rf ~/.zshrc
  ln -sf ~/config-dev/.zshrc ~/
  
  rm -rf ~/.gitconfig
  ln -sf ~/config-dev/git/.gitconfig ~/

  ln -sf ~/config-dev/scripts/* ~/.local/bin/
  chmod u+r+x ~/config-dev/scripts/*
  
  # INSTALL FROM REPOS
  
  sudo add-apt-repository ppa:neovim-ppa/stable -y
  sudo apt-get update && sudo apt install neovim -y
  
  sudo apt install nnn

  # INSTALL NVM && NODE
  
  curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
  nvm install 
  
  # INSTALL NODE APPS
  
  sudo npm install -g vtop
  sudo npm install -g @volar/vue-language-server
  sudo npm install -g vls
  sudo npm install -g emmet-ls
  sudo npm install -g typescript typescript-language-server
  
  NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
  sudo ln -s ~/.joplin-bin/bin/joplin /usr/bin/joplin
  
  # INSTALL PYTHON APPS
  
  pip install python-lsp-server

fi


##### ARCH

if [ $system = 'arch' ]
then

  # UPDATE SYSTEM
  sudo pacman -Syyu
  yay -Syyu

  # GIT & GITHUB
  yay -S github-cli git
  ssh-keygen -f git-hub-key -t ed25519 -C "j.zakrzewsky@gmail.com"
  gh ssh-key add ~/.ssh/git-hub-key.pub 

  
  # OTHER APPS
  yay -S neovim nnn nvm ripgrep fd zsh kitty 
  nvm install

  # INSTALL NODE APPS
  sudo npm install -g vtop, @volar/vue-language-server, vls, emmet-ls, typescript typescript-language-server
  
  NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
  sudo ln -s ~/.joplin-bin/bin/joplin /usr/bin/joplin
  
  # INSTALL PYTHON APPS
  pip install python-lsp-server

  # ZSH
  exec zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  
  # LINK DOT-JAKE
  git clone git@github.com:zakrzaq/dot_jake.git ~/
  ./dot_jake/setup.sh

fi


##### MACOS

if [ $system = 'mac' ]
then
  echo 'mac os script'
fi
