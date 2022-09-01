local util = require "lspconfig.util"
local lspconfig = require "lspconfig"

require("mason").setup {}

require("mason-lspconfig").setup {

  automatic_installation = true,

  ensure_installed = {
    "bash-language-server",
    "clangd",
    "eslint-lsp",
    "json-lsp",
    "lua-language-server",
    "pyright",
    "rust-analyzer",
    "shfmt",
    "sqlls",
    "svelte-language-server",
    "typescript-language-server",
    "vue-language-server",
    "yaml-language-server",
  },
}

-- disable formatting for cases where null-ls is the desired default
-- https://www.reddit.com/r/neovim/comments/ubgi6h/nullls_issues/
local function on_attach(client)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false
end

lspconfig.tsserver.setup { on_attach = on_attach }
lspconfig.jsonls.setup { on_attach = on_attach }

lspconfig.bashls.setup {}

local sumneko_opts = require "user.lsp.settings.sumneko_lua"
lspconfig.sumneko_lua.setup(sumneko_opts)

lspconfig.clangd.setup {}

lspconfig.volar.setup {}
lspconfig.yamlls.setup { on_attach = on_attach }

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

util.default_config = vim.tbl_extend("force", util.default_config, {
  autostart = true,
  capabilities = capabilities,
})

require "user.lsp.null-ls"
