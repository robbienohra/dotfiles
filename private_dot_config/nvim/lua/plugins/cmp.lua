return {
	'hrsh7th/nvim-cmp',
	event = { 'VeryLazy' },
	config = function()
		local cmp = require 'cmp'

		local feedkey = function(key, mode)
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
		end

		cmp.setup {
			snippet = {
				expand = function(args)
					vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
				end,
			},
			mapping = {
				['<Left>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
				['<Right>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
				['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				['<C-e>'] = cmp.mapping {
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				},
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<Tab>'] = cmp.mapping(function(fallback)
					if vim.fn['vsnip#available'](1) == 1 then
						feedkey('<Plug>(vsnip-expand-or-jump)', '')
					else
						fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
					end
				end, { 'i', 's' }),

				['<S-Tab>'] = cmp.mapping(function()
					if vim.fn['vsnip#jumpable'](-1) == 1 then
						feedkey('<Plug>(vsnip-jump-prev)', '')
					end
				end, { 'i', 's' }),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' }, -- For vsnip users.
			}, {
				{ name = 'buffer' },
			}),
		}

		cmp.setup.filetype('gitcommit', {
			sources = cmp.config.sources({
				{ name = 'cmp_git' },
			}, {
				{ name = 'buffer' },
			}),
		})

		cmp.setup.cmdline('/', {
			sources = {
				{ name = 'buffer' },
			},
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' },
			}, {
				{ name = 'cmdline' },
			}),
		})
	end,
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'hrsh7th/vim-vsnip-integ',
		'rafamadriz/friendly-snippets',
	},
}
