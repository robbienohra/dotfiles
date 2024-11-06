return {
	{
		'tpope/vim-fugitive',
		dependencies = {
			'tpope/vim-rhubarb', -- required by fugitive to :Gbrowse
		},
		event = { 'BufEnter' },
		keys = {
			{ '<leader>gm', ':.GBrowse main:%<CR>' },
			{ '<leader>gf', ':GBrowse<CR>' },
			{ '<leader>gl', ':.GBrowse<CR>' },
			{ '<leader>ga', ':Gwrite<CR>' },
			{ '<leader>gA', ':Gwrite!<CR>' },
			{ '<leader>gd', ':GDelete<CR>' },
		},
	},
}
