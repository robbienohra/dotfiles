# dotfiles

- my collection of dotfiles

## Manual steps

### Homebrew

- <https://brew.sh/>

``` sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- <https://doc.rust-lang.org/cargo/getting-started/installation.html>
- <https://github.com/rsteube/carapace-bin>

### Cargo

``` sh
curl https://sh.rustup.rs -sSf | bash -s -- -y --no-modify-path
```

``` sh
source "$HOME/.cargo/env"
```

### Golang

- <https://go.dev/doc/install>

### `just`

``` sh
cargo install just
```

## Initialize dependencies

``` sh
just install-all
```

## Nushell setup

### zoxide

- <https://github.com/ajeetdsouza/zoxide>

### Treesitter

- <https://github.com/nushell/tree-sitter-nu/blob/main/installation/neovim.md>

### Atuin

- <https://github.com/ellie/atuin#nushell>
- <https://atuin.sh/docs/key-binding#disable-up-arrow>
- ensure that `nobind` is run *before* generating the `init.nu` file

``` nu
$env.ATUIN_NOBIND = "true"
atuin init nu | save -f ~/.local/share/atuin/init.nu
```

### Starship

- <https://www.nushell.sh/book/3rdpartyprompts.html#starship>
- <https://starship.rs/#nushell>

### fnm

- <https://github.com/Schniz/fnm/issues/463>

### Zellij

- default config
- <https://github.com/zellij-org/zellij/blob/main/example/config.kdl>
- <https://github.com/Nacho114/harpoon>
- <https://github.com/rvcas/room>

### Carapace

- <https://rsteube.github.io/carapace-bin/installation.html>

## Misc

### Karabiner

- <https://ke-complex-modifications.pqrs.org/#caps_lock_tapped_escape_held_left_control>
- <https://ke-complex-modifications.pqrs.org/#colemak_dh_ansi_layout>

### Nu scripts and neovim references

- <https://github.com/nushell/nu_scripts/tree/main>

- <https://github.com/nushell/nu_scripts/tree/main/themes>

- <https://neovim.io/doc/user/provider.html#provider-python>

- <https://neovim.io/doc/user/provider.html#provider-nodejs>

- <https://neovim.io/doc/user/provider.html#provider-python>

- <https://neovim.io/doc/user/provider.html#provider-nodejs>
