brew tap xwmx/taps # for nb, pb CLIs
brew install $(<packages.txt)

# https://github.com/JetBrains/JetBrainsMono
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# https://ohmyz.sh/#install
# https://github.com/ColemakMods/mod-dh
# https://www.titanium-software.fr/en/onyx.html
# https://github.com/alacritty/alacritty/releases
# Alacritty.desktop
# initialize pass gpg
# https://wiki.archlinux.org/title/Pass

# gh extensions

gh extension install mislav/gh-branch

# install fnm
curl -fsSL https://fnm.vercel.app/install | bash

# apply stow
# todo: do not apply to the ultisnips directory
for d in */ ; do (stow "$d"); done
