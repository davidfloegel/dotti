#!/bin/bash

CONFIG=$(pwd)

#-------------------------------------------------------------------------------
# install things
#-------------------------------------------------------------------------------

# Homebrew
echo "install Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew upgrade
brew update


# ZSH
echo "install ZSH..."
brew reinstall zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
brew install vim
vim --version
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install ripgrep
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

yarn global add typescript-language-server

cd ~/.vim
mkdir -p ~/pack
cd ./pack
git clone https://github.com/tpope/vim-vinegar.git
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q
git clone https://tpope.io/vim/commentary.git
vim -u NONE -c "helptags commentary/doc" -c q
git clone https://github.com/prabirshrestha/async.vim.git
git clone https://github.com/prabirshrestha/vim-lsp.git
git clone https://github.com/prabirshrestha/asyncomplete.vim.git
git clone https://github.com/prabirshrestha/asyncomplete-lsp.vim
git clone https://github.com/ryanolsonx/vim-lsp-typescript.git
git clone https://github.com/prettier/vim-prettier
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

