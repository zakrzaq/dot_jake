# #!/bin/bash
#
# init_config () {
#   echo "...$1"
#   eval exec "$2"" && menu"
#   echo "$1 symlinked"
#   read -n 1 -s -r -p "Press any key to continue"
# }
#
# # RUNTIME
# menu() {
#   echo "A. All"
#   echo "1. ZSH"
#   echo "2. GIT"
#   echo "3. TMUX"
#   echo "4. Kitty"
#   echo "5. Neovim"
#   echo "6. Redshift"
#   echo "7. Scripts"
#   echo "================="
#   echo "Select option to run"
#   read MENU_CHOICE
#   if [ "$MENU_CHOICE" = "A" ] || [ "$CHOICE" = "a" ]; then
  #   init_config "ZSH" ""
  # elif [ "$MENU_CHOICE" = "1" ]; then
    # eval 'ls -la'
    # init_config "ZSH" "ln -sf ~/dot_jake/.zshrc ~/"
#   fi
#
#
# }
#
# while [ "$MENU_CHOICE" != "x" ] || [ "$MENU_CHOICE" != "x" ]; do
#   menu
# done
#

#!/bin/bash

create_symlink() {
  eval ln -sf "$1" "$2"
}

menu() {
  clear
  echo "Dot Jake Setup"
  echo "============"
  echo "0. Synlink all"
  echo "1. Synlink ZSH"
  echo "2. Synlink GIT"
  echo "3. Synlink TMUX"
  echo "4. Synlink Kitty"
  echo "5. Synlink Neovim"
  echo "6. Synlink Redshift"
  echo "7. Synlink Scripts"
  echo "7. Synlink WezTerm"
  echo "X. Exit"
  echo "============"
  read -p "Enter your choice: " choice
  case $choice in
    0)
      create_symlink "~/dot_jake/.zshrc" "~/"
      create_symlink "~/dot_jake/.gitconfig" "~/.gitconfig"
      create_symlink "~/dot_jake/.tmux.conf" "~/.tmux.conf"
      mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak 
      create_symlink "~/dot_jake/kitty.conf" "~/.config/kitty/"
      create_symlink "~/dot_jake/nvim/*" "~/.config/nvim/"
      create_symlink "~/dot_jake/redshift.conf" "~/.config/"
      create_symlink "~/dot_jake/scripts/*" "~/.local/bin/"
      echo 'Full run completed'
      ;;
    1)
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
  menu
done
