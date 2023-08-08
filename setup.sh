#!/bin/bash

ln -sf ~/dot_jake/.zshrc ~/
ln -sf ~/dot_jake/.gitconfig ~/
ln -sf ~/dot_jake/.tmux.conf ~/
mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak
ln -sf ~/dot_jake/kitty.conf ~/.config/kitty/
ln -sf ~/dot_jake/nvim/* ~/.config/nvim/
ln -sf ~/dot_jake/scripts/* ~/.local/bin/

