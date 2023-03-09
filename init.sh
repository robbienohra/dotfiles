# reminders when reinstalling
# remove zsh/.zshrc
# ensure that opt/homebrew does not exist
# remove .zprofile from root
# install brew
# https://brew.sh/
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/robbienohra/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install cargo
# https://doc.rust-lang.org/cargo/getting-started/installation.html
curl https://sh.rustup.rs -sSf | sh

# install cargo packages
cargo install fnm stylua zoxide du-dust xh git-delta

# install brew packages
bash packages.sh

git config credential.helper store

# alacritty

defaults write -g AppleFontSmoothing -int 0

# global npm packages

npm i -g typescript
npm i -g prettier
npm i -g npm-groovy-lint

# stow

# bash stow.sh

# pip3 install pynvim

# setup tmux plugin manager
# https://github.com/tmux-plugins/tpm#installation
