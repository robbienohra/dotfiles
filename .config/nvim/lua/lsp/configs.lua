local configs = {
	bashls = {},
	clangd = {
		cmd = {
			'clangd',
			'--offset-encoding=utf-16',
		},
	},
	dockerls = {},
	eslint = {},
	gopls = {},
	html = {},
	jdtls = {},
	jsonls = {},
	just = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' },
				},
				workspace = {
					library = {
						[vim.fn.expand '$VIMRUNTIME/lua'] = true,
						[vim.fn.stdpath 'config' .. '/lua'] = true,
					},
				},
			},
		},
	},
	marksman = {},
	prismals = {},
	pyright = {},
	rust_analyzer = {},
	sqlls = {},
	svelte = {},
	taplo = {},
	terraformls = {},
	texlab = {},
	tsserver = {},
	yamlls = {
		settings = {
			yaml = {
				keyOrdering = false,
			},
		},
	},
}

return configs
