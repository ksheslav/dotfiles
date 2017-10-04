path=$(pwd)

sudo ln -s $path"/.vim" $HOME"/.vim"
sudo ln -s $path"/.vimrc" $HOME"/.vimrc"
sudo git clone https://github.com/powerline/fonts.git
./fonts/install.sh
vim +PluginInstall +qall
