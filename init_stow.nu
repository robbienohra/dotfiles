let stow_dirs = ['nushell', 'psql', 'rg', 'stow', 'usql', 'vsnip']

for $d in $stow_dirs { stow $d }

stow .config -t ~/.config 
