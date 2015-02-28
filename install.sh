path=$(pwd)

sudo ln -s $path"/.vim" $HOME"/.vim"
sudo ln -s $path"/.vimrc" $HOME"/.vimrc"
sudo git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
sudo git clone https://github.com/powerline/fonts.git
./fonts/install.sh
./gnome-terminal-colors-solarized/install.sh
sudo git clone https://github.com/gmarik/Vundle.vim.git
sudo mv Vundle.vim .vim/bundle/
vim +PluginInstall +qall
