#!/bin/bash

CONFIG=$(pwd)

if [ ! -f ~/.vimrc ]; then
  ln -s ${CONFIG}/vim/vimrc ~/.vimrc
  echo "✅ Linked vimrc config to ~/.vimrc"
else
  echo "🚫 .vimrc file already linked, ignore"
fi

if [ ! -f ~/.vim/ultisnips ]; then
  ln -s ${CONFIG}/vim/ultisnips ~/.vim/ultisnips
  echo "✅ Linked vim ultisnips to ~/.vim/ultisnips"
else
  echo "🚫 autoload config already linked, ignore"
fi

if [ ! -f ~/.vim/autoload ]; then
  ln -s ${CONFIG}/vim/autoload ~/.vim/autoload
  echo "✅ Linked vim autoload to ~/.vim/autoload"
else
  echo "🚫 autoload config already linked, ignore"
fi
