# dotfiles

- my collection of dotfiles

## Install homebrew:

- https://brew.sh/

``` sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- https://doc.rust-lang.org/cargo/getting-started/installation.html

## Install cargo[^1]:

``` sh
curl https://sh.rustup.rs -sSf | bash -s -- -y --no-modify-path
```

```sh
source "$HOME/.cargo/env"
```

## Install cargo packages

``` sh
bash install_cargo_packages.sh
```

## Install brew packages

- `install_brew_packages.sh`

## Install `go`:

- https://go.dev/doc/install

## zoxide

- https://github.com/ajeetdsouza/zoxide

### Treesitter

- https://github.com/nushell/tree-sitter-nu/blob/main/installation/neovim.md

### Atuin

- https://github.com/ellie/atuin#nushell
- https://atuin.sh/docs/key-binding#disable-up-arrow
- ensure that `nobind` is run *before* generating the `init.nu` file

``` nu
$env.ATUIN_NOBIND = "true"
atuin init nu | save -f ~/.local/share/atuin/init.nu
```

### Starship

- https://www.nushell.sh/book/3rdpartyprompts.html#starship
- https://starship.rs/#nushell

### fnm

- https://github.com/Schniz/fnm/issues/463

### Zellij

- default config
- https://github.com/zellij-org/zellij/blob/main/example/config.kdl

## Karabiner

- https://ke-complex-modifications.pqrs.org/#caps_lock_tapped_escape_held_left_control
- https://ke-complex-modifications.pqrs.org/#colemak_dh_ansi_layout

## Lazy.nvim

- plugins located at `~/.local/share/nvim/lazy`

## Node

- https://nodejs.org/en/download

# References

[^1]: [installing cargo without
  zsh](https://github.com/rust-lang/rustup/issues/2040#issuecomment-538721697)
