#!/bin/bash

ls -d */
echo 'Select folder: '
read config

rm -rf ~/.config/nvim
mkdir ~/.config/nvim

ln -sf ~/dot_jake/"$config"/* ~/.config/nvim

echo '"$config" initalized'