return {
	'hrsh7th/nvim-cmp',
	event = { 'VeryLazy' },
	config = function()
		local cmp = require 'cmp'

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
		end

		cmp.setup {
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
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
					if has_words_before() then
						cmp.complete()
					else
						fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
					end
				end, { 'i', 's' }),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
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
	},
}
