# install brew
# https://brew.sh/
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/robbienohra/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install node
# https://nodejs.org/en/download/

# install zsh
# https://ohmyz.sh/#install
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install cargo
# https://doc.rust-lang.org/cargo/getting-started/installation.html
curl https://sh.rustup.rs -sSf | sh

# install cargo packages
cargo install fnm stylua zoxide du-dust xh git-delta

# install brew packages
bash packages.sh

# gooseberry
# https://github.com/out-of-cheese-error/gooseberry#with-brew-osx

brew tap out-of-cheese-error/gooseberry && brew install gooseberry

git config credential.helper store

# stow

# bash stow.sh

# pip3 install pynvim

# pass setup
# create a gpg key with same name as store
# gpg --gen-key
# http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/

# setup mod-dh
# https://github.com/ColemakMods/mod-dh
# reminder: disable mission control keyboard shortcuts to free control key

# setup tmux plugin manager
# https://github.com/tmux-plugins/tpm#installation

# app switcher
# https://manytricks.com/witch/