#!/bin/bash
set -e
echo "NEOVIm installation and setup"
dnf install -y neovim python3-neovim
mkdir -p ~/.config/nvim
git clone https://github.com/singh-man/nvim-IDE.git ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#nvim --headless --cmd +PlugInstall +q
