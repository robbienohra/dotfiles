while read -r package; do
    if brew list --formula | grep -q "^${package}\$"; then
        echo "Package ${package} is already installed."
    else
        brew install "${package}"
    fi
done < brew_packages

# https://github.com/ryanoasis/nerd-fonts
brew tap homebrew/cask-fonts &&
brew install --cask font-jetbrains-mono-nerd-font &&
brew install --cask font-jetbrains-mono
