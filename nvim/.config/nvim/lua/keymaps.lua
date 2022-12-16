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
map("n", "<Leader>gsh", ":G push<CR>")
map("n", "<Leader>gll", ":G pull<CR>")
map("n", "<Leader>gs", ":G<CR>")
map("n", "<Leader>gb", ":G blame<CR>")
map("n", "<Leader>gd", ":Gvdiffsplit! main...head <CR>")
map("n", "<Leader>gr", ":GDelete<CR>")
map("n", "<Leader>ge", ":.GBrowse<CR>")
map("n", "<Leader>gf", ":GBrowse<CR>")
-- map("n", "<Leader>gf", ":!bash ~/dotfiles/diff.sh % <CR>")

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
map("n", "<leader>s", ":update<CR>")
map("n", "U", "<C-r>")
map("n", "<S-d>", "_dd")
map("n", "<S-b>", "dvb")
map("n", "<S-w>", "diw")
map("n", "<Leader>o", "o<Esc>^Da")

-- navigation

map("n", "<M-Down>", "<C-w>j")
map("n", "<M-Up>", "<C-w>k")
map("n", "<M-Left>", "<C-w>h")
map("n", "<M-Right>", "<C-w>l")
map("n", "<Leader>\\", ":15Lexplore <CR>")

-- refresh
-- map("n", "<Leader>r", ":luafile %<CR>")

-- reattach
map("n", "<Leader>r", ":e <CR>")

-- tab
map("n", "tn", ":tabnew <CR>")

-- yank filename
map("n", "<leader>c", ":let @+=expand('%')<CR>")

-- fzf
map("n", "<leader>t", ":Files <CR>")
map("n", "<leader>p", ":History <CR>")
map("n", "<leader>y", ":History: <CR>")
map("n", "<leader>m", ":Marks <CR>")
-- https://github.com/junegunn/fzf/blob/master/README-VIM.md
map(
  "n",
  "<M-c>",
  ":call fzf#run(fzf#wrap({'source': 'fd --type d --hidden --exclude \".git\"', 'options':'--bind ctrl-d:page-down,ctrl-u:page-up --preview-window right,50% --preview \"exa --tree --level=2 {}\"'})) <CR>"
)
map("n", "<leader>b", ":BLines <CR>")
map("n", "<leader>f", ":Rg <CR>")
