#/bin/bash

function silent( )
{
  # https://github.com/timofurrer/.silent
  $* > /dev/null 2>/dev/null
}

echo -n "Installing dependencies..."
silent sudo apt-get install exuberant-ctags cscope pyflakes pandoc python-pip --yes
silent sudo pip install flake8 jedi
silent cd ~/.vim/bundle/YouCompleteMe
silent ./install.sh --clang-completer

echo -e "\rInstalled dependencies\033[K"

echo -n "Moving configuration files from .vim[rc] to .vim[rc].old..."
silent mv ~/.vim ~/.vim.old
silent mv ~/.vimrc ~/.vimrc.old
echo -e "\rMoved configuration files from .vim[rc] to .vim[rc].old\033[K"

echo -n "Downloading vim project from github..."
echo -e "\rDownloaded current revision from github\033[K"

echo -n "Downloading submodules from github..."
silent cd ~/.vim
silent git submodule init
silent git submodule update
echo -e "\rDownloading submodules from github\033[K"

echo -n "Linking vimrc..."
silent ln -s ~/.vim/vimrc ~/.vimrc
echo -e "\rLinked vimrc\033[K"

echo "You can now install the plugins by executing :PluginInstall in vim itself!"
