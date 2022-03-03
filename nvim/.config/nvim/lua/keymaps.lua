local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- fzf
map("n", "<C-t>", ":Files <CR>")
map("n", "<C-f>", ":Rg <CR>")
map("n", "<C-p>", ":Ag <CR>")
map("n", "<leader>y", ":History <CR>")
map("n", "<leader>b", ":Buffers <CR>")
map("n", "<leader>e", ":FZF <CR>")

-- lsp
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<space>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<space>m", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<space>r", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<space>s", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")

-- git
map("n", "<Leader>ga", ":Gwrite<CR>")
map("n", "<Leader>gc", ":Git commit --verbose<CR>")
map("n", "<Leader>gsh", ":Git push<CR>")
map("n", "<Leader>gll", ":Git pull<CR>")
map("n", "<Leader>gs", ":Git<CR>")
map("n", "<Leader>gb", ":Git blame<CR>")
map("n", "<Leader>gd", ":Gvdiffsplit<CR>")
map("n", "<Leader>gr", ":GRemove<CR>")
map("n", "<Leader>ge", ":.GBrowse<CR>")

-- tabs
map("n", "<Tab>", "gt")
map("n", "<S-Tab>", "gT")
map("n", "<S-t>", ":tabnew<CR>")

-- Set working directory
map("n", "<leader>.", ":lcd %:p:h<CR>")

-- Clean search (highlight)
map("n", "<leader><space>", ":noh<cr>")

-- Split
map("n", "<Leader>h", ":<C-u>split<CR>")
map("n", "<Leader>v", ":<C-u>vsplit<CR>")

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>p", '"+gP<CR>')

-- editing
map("n", "ZZ", "ZZ")
map("n", "Q", "ZQ")
map("n", "<C-S>", ":update<CR>")
map("n", "<S-d>", "_dd")
map("n", "<S-b>", "dvb")
map("n", "<S-w>", "diw")
map("n", "<leader>f", ":%s/")
map("i", "<C-S>", "<Esc>:update<CR>")
map("n", "<space>e", ":g/^$/d<CR>")

-- navigation

map("n", "<C-Down>", "<C-w>j")
map("n", "<C-Up>", "<C-w>k")
map("n", "<C-Left>", "<C-w>h")
map("n", "<C-Right>", "<C-w>l")
