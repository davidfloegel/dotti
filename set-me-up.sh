#!/bin/bash

CONFIG=$(pwd)

#-------------------------------------------------------------------------------
# install things
#-------------------------------------------------------------------------------

# Homebrew
echo "install Homebrew..."
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew upgrade


# ZSH
echo "install ZSH..."
# brew reinstall zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ ! -f ~/.zshrc ]; then
  ln -s ${CONFIG}/zsh/zshrc ~/.zshrc
  echo "✅ Linked zshrc config to ~/.zshrc"
else
  echo "✅ .zshrc file already linked, ignore"
fi

# Git
echo "install Git..."
if [ ! -f ~/.gitconfig ]; then
  ln -s ${CONFIG}/git/gitconfig ~/.gitconfig
  echo "✅ Linked gitconfig to ~/.gitconfig"
else
  echo "✅ .gitconfig file already linked, ignore"
fi

if [ ! -f ~/.gitignore_global ]; then
  ln -s ${CONFIG}/git/gitignore_global ~/.gitignore_global
  echo "✅ Linked global gitignore to ~/.gitignore_global"
else
  echo "✅ .gitignore_global file already linked, ignore"
fi

# Git configuration
git config core.ignorecase false

# NVM
 brew reinstall nvm
 nvm install 10
 nvm alias default 10

# HUB
brew install hub

# Install packages
yarn global add prettier tslint

#-------------------------------------------------------------------------------
# Configure VIM
#-------------------------------------------------------------------------------
if [ ! -f ~/.vimrc ]; then
  ln -s ${CONFIG}/vim/vimrc ~/.vimrc
  echo "✅ Linked vimrc config to ~/.vimrc"
else
  echo "✅ .vimrc file already linked, ignore"
fi

if [ ! -f ~/.vim/ultisnips ]; then
  ln -s ${CONFIG}/vim/ultisnips ~/.vim/ultisnips
  echo "✅ Linked vim ultisnips to ~/.vim/ultisnips"
else
  echo "✅ autoload config already linked, ignore"
fi

if [ ! -f ~/.vim/autoload ]; then
  ln -s ${CONFIG}/vim/autoload ~/.vim/autoload
  echo "✅ Linked vim autoload to ~/.vim/autoload"
else
  echo "✅ autoload config already linked, ignore"
fi

echo "reinstalling Vim Plugins"
brew reinstall macvim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +Pluginreinstall +qall

# set up YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.py --ts-completer

