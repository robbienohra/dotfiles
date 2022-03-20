# https://brew.sh/
# https://ohmyz.sh/#install
# https://github.com/ColemakMods/mod-dh
# https://wiki.archlinux.org/title/Pass
# https://github.com/alacritty/alacritty/releases
# install from source
# https://nodejs.org/en/download/
# https://github.com/wbthomason/packer.nvim
# https://stackoverflow.com/questions/36657321/after-installing-homebrew-i-get-zsh-command-not-found-brew

brew install $(<packages.txt)

# https://github.com/JetBrains/JetBrainsMono
# https://github.com/ryanoasis/nerd-fonts
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# fzf

$(brew --prefix)/opt/fzf/install

# git

git config credential.helper store

# gh extensions

gh extension install mislav/gh-branch

# cargo packages
# cargo install --list
# cargo packages
cargo install fnm 
cargo install stylua

# apply stow
for d in */ ; do (stow "$d"); done

# global npm packages
npm install -g typescript typescript-language-server eslint prettier
npm install -g @volar/server

pip3 install pynvim

nvim -c ":LspInstall \
bashls  \
clangd \
emmet_ls \
eslint \
html \
jsonls \
pyright \
rust_analyzer \
sumneko_lua \
svelte \
tsserver \
vuels \
yamlls"
