#!/bin/bash

create_symlink() {
  eval ln -sf "$1" "$2"
}

menu() {
  clear
  echo "Dot Jake Setup"
  echo "============"
  echo "0. Setup all for Linux"
  echo "1. Synlink ZSH"
  echo "2. Synlink GIT"
  echo "3. Synlink TMUX"
  echo "4. Synlink Kitty"
  echo "5. Synlink Neovim"
  echo "6. Synlink Redshift"
  echo "7. Synlink Scripts"
  echo "8. Synlink WezTerm - W10"
  echo "9. Synlink Starship"
  echo "X. Exit"
  echo "============"
  read -p "Enter your choice: " choice
  case $choice in
    0)
      create_symlink "~/dot_jake/.zshrc" "~/"
      create_symlink "~/dot_jake/aliases.zsh" "~/"
      create_symlink "~/dot_jake/.gitconfig" "~/.gitconfig"
      create_symlink "~/dot_jake/.tmux.conf" "~/.tmux.conf"
      mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak 
      create_symlink "~/dot_jake/kitty.conf" "~/.config/kitty/"
      create_symlink "~/dot_jake/nvim/*" "~/.config/nvim/"
      create_symlink "~/dot_jake/redshift.conf" "~/.config/"
      create_symlink "~/dot_jake/scripts/*" "~/.local/bin/"
      create_symlink "~/dot_jake/.starship.toml" "~/.config/
      echo 'Full run completed'
      ;;
    1)
      create_symlink "~/dot_jake/aliases.zsh" "~/"
      create_symlink "~/dot_jake/.zshrc" "~/"
      echo ".zshrc symlinked"
      ;;
    2)
      create_symlink "~/dot_jake/.gitconfig" "~/.gitconfig"
      echo ".gitconfig symlinked"
      ;;
    3)
      create_symlink "~/dot_jake/.tmux.conf" "~/.tmux.conf"
      echo ".tmux.conf symlinked"
      ;;
    4)
      mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak 
      create_symlink "~/dot_jake/kitty.conf" "~/.config/kitty/"
      echo "kitty.conf symlinked"
      ;;
    5)
      create_symlink "~/dot_jake/nvim/*" "~/.config/nvim/"
      echo "nvim symlinked"
      ;;
    6)
      create_symlink "~/dot_jake/redshift.conf" "~/.config/"
      echo "redshift.conf symlinked"
      ;;
    7)
      create_symlink "~/dot_jake/scripts/*" "~/.local/bin/"
      echo ".local/bin symlinked"
      ;;
    8)
      create_symlink "~/dot_jake/.wezterm.lua" "~/"
      echo ".wezterm.lua symlinked"
      ;;
    9)
      create_symlink "~/dot_jake/.starship.toml" "~/.config/
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

while true; do
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/kitty
  mkdir -p ~/.local/bin
  menu
done
