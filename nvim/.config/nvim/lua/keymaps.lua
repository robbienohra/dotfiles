local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- fzf
map("n", "<C-t>", ":Files <CR>", { noremap = true, silent = true })
map("n", "<C-f>", ":Rg <CR>", { noremap = true, silent = true })
map("n", "<leader>y", ":History <CR>", { noremap = true, silent = true })
map("n", "<leader>b", ":Buffers <CR>", { noremap = true, silent = true })
map("n", "<leader>e", ":FZF <CR>", { noremap = true, silent = true })

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
map("n", "<Leader>gg", ":.GBrowse<CR>")

-- editing
map("n", "ZZ", "ZZ")
map("n", "Q", "ZQ")
map("n", "<C-S>", ":update<CR>")
map("n", "<esc>", ":noh <CR>")
map("n", "<S-d>", "_dd")
map("n", "<S-b>", "dvb")
map("n", "<S-w>", "diw")
map("n", "<leader>f", ":%s/")
map("v", "<C-c>", ":w !pbcopy<CR><CR>")
map("i", "<C-S>", "<Esc>:update<CR>")
map("n", "<space>e", ":g/^$/d<CR>")
-- map('n', '<F4>' :let @+=expand("%")<CR>
-- map <silent> <F9> :exec 'source '.bufname('%')<CR>
-- map <NL> i<CR><CR><up><ESC>
-- nnoremap <leader>. :lcd %:p:h<CR>
-- nnoremap <leader>cd :cd %:p:h<CR>
