brew install --force $(<packages)
$(brew --prefix)/opt/fzf/install

# terraform

brew tap hashicorp/tap

brew install hashicorp/tap/terraform

# https://github.com/ryanoasis/nerd-fonts
brew tap homebrew/cask-fonts &&
brew install --cask font-jetbrains-mono-nerd-font
