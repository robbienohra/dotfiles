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
-- map("n", "<C-p>", ":Ag <CR>")
map("n", "<C-y>", ":call fzf#run(fzf#wrap({'source': 'fd --type d --hidden --exclude \".git\"'})) <CR>")
map("n", "<Leader>y", ":History: <CR>")
map("n", "<Leader>b", ":Buffers <CR>")
map("n", "<Leader>e", ":FZF <CR>")

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
map("n", "<Leader>gc", ":G commit --verbose<CR>")
map("n", "<Leader>gsh", ":G push<CR>")
map("n", "<Leader>gll", ":G pull<CR>")
map("n", "<Leader>gs", ":G<CR>")
map("n", "<Leader>gb", ":G blame<CR>")
map("n", "<Leader>gd", ":Gvdiffsplit! master...head <CR>")
map("n", "<Leader>gr", ":GRemove<CR>")
map("n", "<Leader>ge", ":.GBrowse<CR>")
map("n", "<Leader>gf", ":!bash ~/dotfiles/diff.sh % <CR>")

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

map("n", "<M-Down>", "<C-w>j")
map("n", "<M-Up>", "<C-w>k")
map("n", "<M-Left>", "<C-w>h")
map("n", "<M-Right>", "<C-w>l")
map("n", "<Leader>\\", ":15Lexplore <CR>")

-- full file path

map("n", "f", "1<C-g>")

-- plugins
-- refresh

map("n", "<Leader>r", ":luafile %<CR>")

-- tab
map("n", "tn", ":tabnew <CR>")

-- yank filename
map("n", "<leader>c", ":let @+=expand('%')<CR>")

-- zk

local opts = { noremap = true, silent = false }

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap(
  "n",
  "<leader>zf",
  "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>",
  opts
)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
