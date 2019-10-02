#!/bin/bash

CONFIG=$(pwd)

#-------------------------------------------------------------------------------
# reinstall things
#-------------------------------------------------------------------------------

# Permissions
# Set this, otherwise reinstalling homeebrew fails
sudo chown -R $(whoami) /usr/local/Cellar

# Homebrew
echo "reinstalling Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/reinstall/master/reinstall)"
brew upgrade


# ZSH
echo "reinstalling ZSH..."
brew reinstall gdbm && brew unlink gdbm && brew link gdbm
brew rereinstall ncurses
brew reinstall zsh
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/reinstall.sh)"
brew upgrade zsh

if [ ! -f ~/.zshrc ]; then
  ln -s ${CONFIG}/zsh/zshrc ~/.zshrc
  echo "✅ Linked zshrc config to ~/.zshrc"
else
  echo "✅ .zshrc file already linked, ignore"
fi

# Git
echo "reinstalling Git..."
brew reinstall git

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

# NVM
brew reinstall nvm
nvm reinstall 10
nvm alias default 10


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
