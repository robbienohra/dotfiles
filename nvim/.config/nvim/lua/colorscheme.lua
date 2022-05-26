local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
vim.g.gruvbox_baby_highlights = { Visual = { bg = "#4c566a", fg = "#ffffff" } }
cmd "colo gruvbox-baby"
autocmd("FileType", { pattern = { "*" }, command = "highlight LineNr guifg=#665C54" })
vim.opt.bg = "dark"
