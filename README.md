# dotfiles

- my collection of dotfiles

## Setup

Install homebrew:

- https://brew.sh/

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- https://doc.rust-lang.org/cargo/getting-started/installation.html

Install cargo:

```sh
curl https://sh.rustup.rs -sSf | sh
```

Install packages:

- `install_brew_packages.sh`
- `install_cargo_packages.sh`

## Nushell

### Treesitter

- https://github.com/nushell/tree-sitter-nu/blob/main/installation/neovim.md

### Atuin

- https://github.com/ellie/atuin#nushell
- https://atuin.sh/docs/key-binding#disable-up-arrow
- ensure that `nobind` is run _before_ generating the `init.nu` file

```
let-env ATUIN_NOBIND = "true"
atuin init nu | save -f ~/.local/share/atuin/init.nu
```

### Starship

- https://www.nushell.sh/book/3rdpartyprompts.html#starship
- https://starship.rs/#nushell

### fnm

- https://github.com/Schniz/fnm/issues/463

### configs

```sh
ln -s /Users/robbienohra/dotfiles/nushell /Users/robbienohra/Library/Application\ Support/nushell
```

### Zellij

- default config
- https://github.com/zellij-org/zellij/blob/main/example/config.kdl

## Karabiner

- https://ke-complex-modifications.pqrs.org/#caps_lock_tapped_escape_held_left_control
- https://ke-complex-modifications.pqrs.org/#colemak_dh_ansi_layout
