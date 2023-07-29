return {
	"tpope/vim-fugitive",
	"tpope/vim-repeat",
	"tpope/vim-rhubarb", -- required by fugitive to :Gbrowse
	"tpope/vim-scriptease",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
	{
		"tpope/vim-vinegar",
		config = function()
			vim.g.netrw_list_hide = "(^|ss)\zs.S+"
			vim.g.netrw_altv = 1
			vim.g.netrw_winsize = 80
		end
	}
}
