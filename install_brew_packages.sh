brew install $(<packages)


# https://github.com/junegunn/fzf#using-homebrew
$(brew --prefix)/opt/fzf/install

# https://github.com/ryanoasis/nerd-fonts
brew tap homebrew/cask-fonts &&
brew install --cask font-jetbrains-mono-nerd-font
