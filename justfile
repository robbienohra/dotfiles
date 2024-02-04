set shell := ["sh", "-c"]

# Update Neovim plugins
update-nvim:
	nvim --headless "+Lazy! sync" +qa

# Update Cargo packages
update-cargo:
	cargo install-update -a

# Install Cargo packages
install-cargo:
	for package in $(cat config/cargo_packages); do cargo install "$package"; done

# Update Brew packages
update-brew:
	brew update
	brew upgrade

# Install Brew packages
install-brew:
	brew tap homebrew/cask-fonts
	bash config/install_brew.sh

# Install Go packages
install-go:
	for package in $(cat config/go_packages); do go install "$package"; done

init-stow:
	stow_dirs=("psql" "rg" "stow" "usql" "vsnip" "git" "rectangle" "nushell")
	for d in "${stow_dirs[@]}"; do stow "$d"; done; stow -t ~/.config .config

# Update all packages
install-all:
	just install-cargo
	just install-brew
	just install-go

# Update all packages
update-all:
	just update-nvim
	just update-cargo
	just update-brew
	just install-go

format-lua:
	@echo "Formatting all Lua scripts..."
	find . -name '*.lua' -exec stylua --config-path ~/.config/stylua.toml {} +
	@echo "Formatting complete."
