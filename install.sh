# https://brew.sh/
# https://ohmyz.sh/#install
# https://github.com/ColemakMods/mod-dh
# https://wiki.archlinux.org/title/Pass
# need to create a gpg key with same name as store
# gpg --gen-key
# http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/
# https://github.com/alacritty/alacritty/releases
# install from source
# https://nodejs.org/en/download/
# https://github.com/wbthomason/packer.nvim
# https://stackoverflow.com/questions/36657321/after-installing-homebrew-i-get-zsh-command-not-found-brew
# reminder: disable mission control keyboard shortcuts to free control key
# https://dandavison.github.io/delta/installation.html
# Tmux Plugin Manager
# https://github.com/tmux-plugins/tpm#installation
# xh
# https://github.com/ducaale/xh
# https://github.com/bootandy/dust

brew install $(<packages.txt)

# https://github.com/JetBrains/JetBrainsMono
# https://github.com/ryanoasis/nerd-fonts
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# wezterm
# https://wezfurlong.org/wezterm/install/macos.html#homebrew

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
cargo install viu
cargo install zoxide
cargo install --locked ripgrep_all

# apply stow
for d in */ ; do (stow "$d"); done

# global npm packages
npm install -g typescript typescript-language-server eslint prettier
npm install -g @volar/server

pip3 install pynvim
