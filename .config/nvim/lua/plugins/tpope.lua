return {
	{
		'tpope/vim-fugitive',
		keys = {
			{ '<leader>gm', ':.GBrowse main:%<CR>' },
			{ '<leader>gf', ':GBrowse<CR>' },
			{ '<leader>gl', ':.GBrowse<CR>' },
			{ '<leader>ga', ':Gwrite<CR>' },
			{ '<leader>gA', ':Gwrite!<CR>' },
			{ '<leader>gd', ':Gdelete<CR>' },
		},
	},
	'tpope/vim-repeat',
	'tpope/vim-rhubarb', -- required by fugitive to :Gbrowse
	'tpope/vim-unimpaired',
}
