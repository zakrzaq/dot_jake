#!/bin/bash

create_symlink() {
  ln -sf "$1" "$2"
}

setup_all() {
  create_symlink "$HOME/dot_jake/.zshrc" "$HOME/.zshrc"
  create_symlink "$HOME/dot_jake/aliases.zsh" "$HOME/aliases.zsh"
  create_symlink "$HOME/dot_jake/.gitconfig" "$HOME/.gitconfig"
  create_symlink "$HOME/dot_jake/.tmux.conf" "$HOME/.tmux.conf"
  mv "$HOME/.config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf.bak" 
  create_symlink "$HOME/dot_jake/kitty.conf" "$HOME/.config/kitty/kitty.conf"
  create_symlink "$HOME/dot_jake/nvim" "$HOME/.config/nvim"
  create_symlink "$HOME/dot_jake/redshift.conf" "$HOME/.config/redshift.conf"
  create_symlink "$HOME/dot_jake/scripts" "$HOME/.local/bin"
  create_symlink "$HOME/dot_jake/.starship.toml" "$HOME/.config/starship.toml"
  echo 'Full run completed'
}

menu() {
  clear
  echo "Dot Jake Setup"
  echo "============"
  echo "0. Setup all for Linux"
  echo "1. Symlink ZSH"
  echo "2. Symlink GIT"
  echo "3. Symlink TMUX"
  echo "4. Symlink Kitty"
  echo "5. Symlink Neovim"
  echo "6. Symlink Redshift"
  echo "7. Symlink Scripts"
  echo "8. Symlink WezTerm - W10"
  echo "9. Symlink Starship"
  echo "X. Exit"
  echo "============"
  read -p "Enter your choice: " choice
  case $choice in
    0)
      setup_all
      ;;
    1)
      create_symlink "$HOME/dot_jake/aliases.zsh" "$HOME/aliases.zsh"
      create_symlink "$HOME/dot_jake/.zshrc" "$HOME/.zshrc"
      echo ".zshrc symlinked"
      ;;
    2)
      create_symlink "$HOME/dot_jake/.gitconfig" "$HOME/.gitconfig"
      echo ".gitconfig symlinked"
      ;;
    3)
      create_symlink "$HOME/dot_jake/.tmux.conf" "$HOME/.tmux.conf"
      echo ".tmux.conf symlinked"
      ;;
    4)
      mv "$HOME/.config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf.bak"
      create_symlink "$HOME/dot_jake/kitty.conf" "$HOME/.config/kitty/kitty.conf"
      echo "kitty.conf symlinked"
      ;;
    5)
      create_symlink "$HOME/dot_jake/nvim" "$HOME/.config/nvim"
      echo "nvim symlinked"
      ;;
    6)
      create_symlink "$HOME/dot_jake/redshift.conf" "$HOME/.config/redshift.conf"
      echo "redshift.conf symlinked"
      ;;
    7)
      create_symlink "$HOME/dot_jake/scripts" "$HOME/.local/bin"
      echo ".local/bin symlinked"
      ;;
    8)
      create_symlink "$HOME/dot_jake/.wezterm.lua" "$HOME/.wezterm.lua"
      echo ".wezterm.lua symlinked"
      ;;
    9)
      create_symlink "$HOME/dot_jake/.starship.toml" "$HOME/.config/starship.toml"
      echo ".starship.toml symlinked"
      ;;
    x|X)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid choice"
      ;;
  esac
  read -n 1 -s -r -p "Press any key to return to the menu"
}

if [ "$1" == "0" ]; then
  setup_all
  exit 0
fi

while true; do
  mkdir -p "$HOME/.config/nvim"
  mkdir -p "$HOME/.config/kitty"
  mkdir -p "$HOME/.local/bin"
  menu
done

