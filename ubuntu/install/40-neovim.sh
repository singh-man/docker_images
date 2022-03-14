#!/bin/bash
set -e
echo "NEOVIM installation and setup; make sure clang is installed before"

cd /opt
curl -L https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz -s -o /opt/a.tar.gz
tar -xzf /opt/a.tar.gz
rm /opt/a.tar.gz
echo "alias nvim='/opt/nvim-linux64/bin/nvim'" >> ~/myAlias

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#Get singh-man IDE plugin setup
mkdir -p ~/.config/nvim
git clone https://github.com/singh-man/nvim-IDE.git ~/.config/nvim
#nvim --headless PlugInstall +q

cd -
