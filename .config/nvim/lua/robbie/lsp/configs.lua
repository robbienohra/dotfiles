local configs = {
	bashls = {},
	clangd = {},
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
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand "$VIMRUNTIME/lua"] = true,
						[vim.fn.stdpath "config" .. "/lua"] = true,
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

-- if not lspconfig.helm_ls then
-- 	lspconfig.helm_ls = {
-- 		default_config = {
-- 			cmd = { "helm_ls", "serve" },
-- 			filetypes = { "helm" },
-- 			root_dir = function(fname)
-- 				return util.root_pattern "Chart.yaml"(fname)
-- 			end,
-- 		},
-- 	}
-- end
--
-- lspconfig.helm_ls.setup {
-- 	filetypes = { "helm" },
-- 	cmd = { "helm_ls", "serve" },
-- }
--
