#!/bin/bash

INSTALL_DIR=$HOME/.dotfiles

# helper functions
end() {
   echo "Installation complete!"
   echo "Open VIM and run :PlugInstall to finish plugins installation"
   exit 0
}

# get running dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# mv this installer directory to ~/.dotfiles
if [ ! -d $INSTALL_DIR ]; then
   echo "$INSTALL_DIR Already exists... aborting"
   exit -1
fi

if [ $(pwd) != $HOME/.dotfiles ]; then
   echo "Moving to $HOME/.dotfiles"

   mv $DIR $HOME/.dotfiles
   if [ $? -ne 0 ]; then
      echo "Something went wrong"
      exit -1
   fi
fi

#install vim-plug
mkdir -p ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\nsource $INSTALL_DIR/.bashrc" >> $HOME/.bashrc

echo "Installing VIM plugins"
vim +PlugInstall +qall

echo "Installing YouCompleteMe dependencies"
sudo apt install build-essential cmake python3-dev

pushd $HOME/.vim/plugged/youcompleteme
python3 install.py 2>&1 > $INSTALL_DIR/log_install_$(date "+%s").log
if [ $? -eq 0 ]; then
   echo "YouCompleteMe compilling completed successfully"
else
   echo "YouCompleteMe installation failed, please read the docs and proceeed manually"
   echo "https://github.com/ycm-core/YouCompleteMe"
fi

# end script
end
