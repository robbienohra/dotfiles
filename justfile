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

update-go: install-go

init-stow:
	# run this with --no-config-file and --no-history options for nushell in alacritty
	mkdir `~/Library/Application Support/nushell`
	stow -t `~/Library/Application Support/nushell/` nushell/
	stow_dirs=("psql" "rg" "stow" "usql" "vsnip" "git" "rectangle" "nushell" "clangd" "clang-format")
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
