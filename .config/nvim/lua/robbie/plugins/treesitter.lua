return {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufReadPost',
	cmd = 'TSUpdate',
	dependencies = {
		'windwp/nvim-ts-autotag',
	},
	config = function()
		require('nvim-treesitter.configs').setup {
			rainbow = {
				enable = true,
			},
			ensure_installed = {
				'bash',
				'cmake',
				'cpp',
				'css',
				'dockerfile',
				'go',
				'hcl',
				'html',
				'javascript',
				'json',
				'kdl',
				'lua',
				'markdown',
				'markdown_inline',
				'nu',
				'prisma',
				'python',
				'rust',
				'scss',
				'svelte',
				'terraform',
				'toml',
				'typescript',
				'vim',
				'vue',
				'yaml',
			},
			autotag = {
				enable = true,
				filetypes = {
					'html',
					'javascript',
					'typescript',
					'javascriptreact',
					'typescriptreact',
					'svelte',
					'vue',
					'tsx',
					'jsx',
					'rescript',
				},
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}

		local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

		parser_config.nu = {
			install_info = {
				url = 'https://github.com/nushell/tree-sitter-nu',
				files = { 'src/parser.c' },
				branch = 'main',
			},
			filetype = 'nu',
		}
	end,
}
