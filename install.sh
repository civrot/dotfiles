#!/bin/sh

# borrowed from https://github.com/thoughtbot/dotfiles/commit/fdbd7b52486c166230931b678f810afcae5f14a9#install.sh

for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
      echo "Creating $target"
      ln -sf "$PWD/$name" "$target"
    fi
  fi
done

rm -rf ~/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -u ~/.vimrc.bundles +BundleInstall! +qa
