set shell := ["sh", "-c"]

# Update Neovim plugins
update-nvim:
    nvim --headless -c "Lazy update" -c "qall"

# Update Cargo packages
update-cargo:
    cargo install-update -a

# Install Cargo packages from a list
install-cargo:
    for package in $(cat config/cargo_packages.txt); do cargo install "$package"; done

# Update Brew packages
update-brew:
    brew update
    brew upgrade

# Install Brew packages from a list
install-brew:
    for package in $(cat config/brew_packages.txt); do brew install "$package"; done

# Install Go packages from a list
install-go:
    for package in $(cat config/go_packages.txt); do go install "$package"; done

init-stow:
    stow_dirs=("psql" "rg" "stow" "usql" "vsnip" "git" "rectangle" "nushell")
    for d in "${stow_dirs[@]}"; do stow "$d"; done; stow -t ~/.config .config

# Update all packages
update-all:
    just update-nvim
    just update-cargo
    just update-brew
    just install-go