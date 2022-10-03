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
    "yamlfmt"
  },
}

-- disable formatting for cases where null-ls is the desired default
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
local function on_attach(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentFormattingProvider = false
end

lspconfig.bashls.setup { on_attach = on_attach }
lspconfig.clangd.setup {}
lspconfig.jsonls.setup { on_attach = on_attach }
lspconfig.tsserver.setup { on_attach = on_attach }
lspconfig.volar.setup { on_attach = on_attach }
lspconfig.yamlls.setup { on_attach = on_attach }

local sumneko_opts = require "user.lsp.settings.sumneko_lua"
lspconfig.sumneko_lua.setup(sumneko_opts)


local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

util.default_config = vim.tbl_extend("force", util.default_config, {
  autostart = true,
  capabilities = capabilities,
})

require "user.lsp.null-ls"
