while read -r package; do
    if brew list --formula | grep -q "^${package}\$"; then
        echo "Package ${package} is already installed."
    else
        brew install "${package}"
    fi
done < brew_packages

# https://github.com/junegunn/fzf#using-homebrew
$(brew --prefix)/opt/fzf/install

# https://github.com/ryanoasis/nerd-fonts
brew tap homebrew/cask-fonts &&
brew install --cask font-jetbrains-mono-nerd-font &&
brew install --cask font-jetbrains-mono
