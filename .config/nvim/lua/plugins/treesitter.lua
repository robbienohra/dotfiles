return {
	{
		'nvim-treesitter/nvim-treesitter',
		event = 'BufReadPost',
		cmd = 'TSUpdate',
		dependencies = {
			'windwp/nvim-ts-autotag',
			'LhKipp/nvim-nu',
			'nvim-treesitter/nvim-treesitter-textobjects',
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
					'hjson',
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
					'vimdoc',
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
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
							['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
						},
						selection_modes = {
							['@parameter.outer'] = 'v', -- charwise
							['@function.outer'] = 'V', -- linewise
							['@class.outer'] = '<c-v>', -- blockwise
						},
						include_surrounding_whitespace = true,
					},
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
	},
}
