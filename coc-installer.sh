#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

extensions="coc-snippets coc-python coc-go coc-json coc-yaml coc-fzf-preview coc-sh coc-spell-checker coc-highlight"

# Install latest nodejs
echo "Please make sure nodejs is installed before running this script."
echo "ex. apt-get install nodejs.\n"
read -p "press y to continue...." n

[[ ! "$n" = "y"  && ! "$n" = "Y" ]] && exit 1

# The following code is to auto install nodejs but it is not working for now. 
#if [ ! -x "$(command -v node)" ]; then
#    curl --fail -LSs https://install-node.now.sh/latest | sh
#    export PATH="/usr/local/bin/:$PATH"
#    # Or use package manager, e.g.
#    # sudo apt-get install nodejs
#fi

# Use package feature to install coc.nvim

# for vim8
mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
# for neovim
# mkdir -p ~/.local/share/nvim/site/pack/coc/start
# cd ~/.local/share/nvim/site/pack/coc/start
# curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}' > package.json
fi
# Change extension names to the extensions you need
npm install $extensions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

