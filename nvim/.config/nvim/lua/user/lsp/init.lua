local util = require "lspconfig.util"
local lspconfig = require "lspconfig"

require("mason-tool-installer").setup {

  ensure_installed = {
    "clang_format",
    "deno_fmt",
    "prettier",
    "shfmt",
    "sql_formatter",
    "stylua",
    "terraform_fmt",
    "yamlfmt",
  },

  auto_update = false,
  run_on_start = true,
  -- start_delay = 3000, -- 3 second delay
  -- debounce_hours = 5, -- at least 5 hours between attempts to install/update
}

require("mason").setup {}

require("mason-lspconfig").setup {

  automatic_installation = true,

  ensure_installed = {
    "bashls",
    "clangd",
    "denols",
    "dockerls",
    "eslint",
    "jdtls",
    "jsonls",
    "lua_ls",
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

-- disable formatting for cases where null-ls is the desired default
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
local function on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentFormattingProvider = false
  -- https://www.reddit.com/r/neovim/comments/rwoxne/comment/hre6iu3/?utm_source=share&utm_medium=web2x&context=3
  if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
    vim.diagnostic.disable()
  end
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
  require("cmp_nvim_lsp").default_capabilities(get_forced_lsp_capabilities())
end

util.default_config = vim.tbl_extend("force", util.default_config, {
  autostart = true,
  on_attach = my_lsp_on_attach,
  capabilities = get_forced_lsp_capabilities(),
})

lspconfig.bashls.setup { on_attach = on_attach }
lspconfig.clangd.setup {}
lspconfig.jdtls.setup { on_attach = on_attach }
lspconfig.jsonls.setup { on_attach = on_attach }
lspconfig.prismals.setup { on_attach = on_attach }
lspconfig.terraformls.setup { on_attach = on_attach }
lspconfig.tsserver.setup { on_attach = on_attach }
lspconfig.volar.setup { on_attach = on_attach }
lspconfig.yamlls.setup { on_attach = on_attach }
