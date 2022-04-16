local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
cmd("colo gruvbox-baby")
autocmd("FileType", { pattern = { "*" }, command = "highlight LineNr guifg=#665C54" })
vim.opt.bg = "dark"
-- legacy gruvbox theme
-- vim.g.gruvbox_contrast_dark = 'medium'
-- vim.g.gruvbox_invert_selection = 0
-- vim.g.gruvbox_italic = 1
-- vim.g.gruvbox_sign_column = 'bg0'
