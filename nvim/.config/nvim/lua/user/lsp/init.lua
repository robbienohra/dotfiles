local util = require "lspconfig.util"
local lspconfig = require "lspconfig"

require("mason").setup {}

require("mason-lspconfig").setup {

  automatic_installation = true,

  ensure_installed = {
    "bashls",
    "clangd",
    "eslint",
    "jsonls",
    "sumneko_lua",
    "prismals",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "svelte",
    "terraformls",
    "tsserver",
    "volar",
    "yamlls",
  },
}

-- formatters
-- shfmt
-- yamlfmt

-- disable formatting for cases where null-ls is the desired default
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
local function on_attach(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentFormattingProvider = false
end

local function get_forced_lsp_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  return capabilities
end

local function my_lsp_on_attach()
  require("cmp_nvim_lsp").update_capabilities(get_forced_lsp_capabilities())
end

util.default_config = vim.tbl_extend("force", util.default_config, {
  autostart = true,
  on_attach = my_lsp_on_attach,
  capabilities = get_forced_lsp_capabilities(),
})

lspconfig.bashls.setup { on_attach = on_attach }
lspconfig.clangd.setup {}
lspconfig.jsonls.setup { on_attach = on_attach }
lspconfig.terraformls.setup { on_attach = on_attach }
lspconfig.tsserver.setup { on_attach = on_attach }
lspconfig.volar.setup { on_attach = on_attach }
lspconfig.yamlls.setup { on_attach = on_attach }

require "user.lsp.null-ls"
