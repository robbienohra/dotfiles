local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- lsp
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true } <CR>")
map("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<space>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<space>m", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<space>r", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<space>s", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<space>d", "<cmd>lua vim.diagnostic.disable()<CR>")

-- git
map("n", "<Leader>ga", ":Gwrite<CR>")
map("n", "<Leader>gc", ":G commit --verbose<CR>")
map("n", "<Leader>gp", ":G push<CR>")
map("n", "<Leader>gl", ":G pull<CR>")
map("n", "<Leader>gs", ":G<CR>")
map("n", "<Leader>gb", ":G blame<CR>")
map("n", "<Leader>gd", ":Gvdiffsplit! main...head <CR>")
map("n", "<Leader>gr", ":GDelete<CR>")
map("n", "<Leader>ge", ":.GBrowse<CR>")
map("n", "<Leader>gf", ":GBrowse<CR>")
map("n", "<Leader>gt", ":G tag<CR>")

-- Set working directory
map("n", "<leader>.", ":lcd %:p:h<CR>")

-- Clean search (highlight)
map("n", "<leader><space>", ":noh<cr>")

-- Split
map("n", "<Leader>w", "<C-w>")

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>p", '"+gP<CR>')

-- editing
map("n", "ZZ", "ZZ")
map("n", "Q", "ZQ")
map("n", "<leader>s", ":update<CR>")
map("n", "U", "<C-r>")
map("n", "<S-d>", "_dd")
map("n", "<S-b>", "dvb")
map("n", "<S-w>", "diw")
map("n", "<Leader>o", "o<Esc>^Da")

-- navigation

map("n", "<C-Down>", "<C-w>j")
map("n", "<C-Up>", "<C-w>k")
map("n", "<C-Left>", "<C-w>h")
map("n", "<C-Right>", "<C-w>l")

-- page up/down with centering
map("n", "<C-k>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- refresh
map("n", "<Leader>r", ":luafile %<CR>")

-- reattach
-- map("n", "<Leader>r", ":e <CR>")

-- yank filename
-- map("n", "<leader>c", ":let @+=expand('%')<CR>")
map("n", "<leader>c", ":let @+=expand('%:p')<CR>")

-- fzf
map("n", "<leader>b", "<cmd>FzfLua blines<cr>")
map("n", "<leader>t", "<cmd>FzfLua files<cr>")
map("n", "<leader>f", "<cmd>FzfLua grep_project<cr>")
map("n", "<leader>p", "<cmd>FzfLua oldfiles<cr>")
map("n", "<leader>y", "<cmd>FzfLua command_history<cr>")
-- map("n", "<leader>t", ":FzfLua<space>", { silent = false })

-- move snippets
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- harpoon
map("n", "<leader>h", ":lua require('harpoon.mark').add_file()<CR>")
map("n", "<esc>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

-- pencil
map("n", "<F7>", ":<C-u>PFormatToggle<cr>")
map("i", "<F7>", "<C-o>:PFormatToggle<cr>")