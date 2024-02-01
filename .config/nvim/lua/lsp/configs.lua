local configs = {
	bashls = {},
	clangd = {},
	marksman = {},
	efm = {
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
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
	prismals = {},
	pyright = {},
	rust_analyzer = {},
	sqlls = {},
	svelte = {},
	terraformls = {},
	texlab = {},
	tsserver = {},
	volar = {},
	yamlls = {
		settings = {
			yaml = {
				keyOrdering = false,
			},
		},
	},
}

return configs
