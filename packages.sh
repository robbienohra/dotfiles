# https://github.com/JetBrains/JetBrainsMono
# https://github.com/ryanoasis/nerd-fonts
brew tap homebrew/cask-fonts
brew install --force --cask font-jetbrains-mono
brew tap out-of-cheese-error/gooseberry && brew install gooseberry
brew install --force $(<packages)
$(brew --prefix)/opt/fzf/install
