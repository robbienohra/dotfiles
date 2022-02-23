local servers = {
  "bashls",
  "clangd",
  "eslint",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "tsserver",
  -- "volar",
  "vuels",
  "yamlls",
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup({
    flags = {
      debounce_text_changes = 50,
    },
    capabilities = capabilities,
    on_attach = function(client)
      if client.name == "tsserver" or client.name == "jsonls" then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end
    end,
  })
end

require("user.lsp.null-ls")
