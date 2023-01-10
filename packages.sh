# https://github.com/JetBrains/JetBrainsMono
# https://github.com/ryanoasis/nerd-fonts
brew tap homebrew/cask-fonts
brew install --force --cask font-jetbrains-mono
brew install --force $(<packages)
$(brew --prefix)/opt/fzf/install

# terraform

brew tap hashicorp/tap

brew install hashicorp/tap/terraform
