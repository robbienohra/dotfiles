return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		'towolf/vim-helm',
	},
	config = function()
		local util = require 'lspconfig.util'
		local lspconfig = require 'lspconfig'
		require('mason').setup {}
		require('mason-tool-installer').setup {

			ensure_installed = {
				'clang-format',
				'golangci-lint',
				'go-debug-adapter',
				'prettier',
				'prettierd',
				'shfmt',
				'stylua',
				'yamlfmt',
			},

			auto_update = false,
			run_on_start = true,
			-- start_delay = 3000, -- 3 second delay
			-- debounce_hours = 5, -- at least 5 hours between attempts to install/update
		}
		local mason_lspconfig = require 'mason-lspconfig'
		mason_lspconfig.setup {

			automatic_installation = true,

			ensure_installed = {
				'bashls',
				'clangd',
				'efm',
				'dockerls',
				'eslint',
				'gopls',
				'html',
				'jdtls',
				'jsonls',
				'lua_ls',
				'marksman',
				'prismals',
				'pyright',
				'rust_analyzer',
				'sqlls',
				'svelte',
				'terraformls',
				'texlab',
				'tsserver',
				'volar',
				'yamlls',
			},
		}
		local function get_forced_lsp_capabilities()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = { 'documentation', 'detail', 'additionalTextEdits' },
			}
			return capabilities
		end

		local function my_lsp_on_attach()
			require('cmp_nvim_lsp').default_capabilities(get_forced_lsp_capabilities())
		end

		util.default_config = vim.tbl_extend('force', util.default_config, {
			autostart = true,
			on_attach = my_lsp_on_attach,
			capabilities = get_forced_lsp_capabilities(),
		})

		mason_lspconfig.setup_handlers {
			function(ls)
				lspconfig[ls].setup(require('lsp.configs')[ls])
			end,
		}
	end,
}
