export alias k = kubectl
export alias j = npm run jest --
export alias n = nvim .

export alias v = nvim -c 'call feedkeys(":DiffviewOpen", "t")'
export alias vm = nvim -c 'call feedkeys(":DiffviewOpen origin/main...head --imply-local", "t")'
export alias vw = nvim -c 'call feedkeys(":DiffviewOpen origin/HEAD...HEAD --imply-local", "t")'

# https://github.com/nushell/nu_scripts/blob/main/aliases/git/git-aliases.nu
