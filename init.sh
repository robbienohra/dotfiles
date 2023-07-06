# install brew
# https://brew.sh/
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install cargo
# https://doc.rust-lang.org/cargo/getting-started/installation.html
curl https://sh.rustup.rs -sSf | sh

# install brew packages
bash packages.sh

git config credential.helper store

# global npm packages

# npm i -g typescript
# npm i -g prettier
# npm i -g npm-groovy-lint

# stow

# nushell symlink
ln -s /Users/robbienohra/dotfiles/nushell /Users/robbienohra/Library/Application\ Support/nushell

# bash stow.sh
# pip3 install pynvim

# karabiner
# https://ke-complex-modifications.pqrs.org/#caps_lock_tapped_escape_held_left_control

# colemak
# https://ke-complex-modifications.pqrs.org/#colemak_dh_ansi_layout
