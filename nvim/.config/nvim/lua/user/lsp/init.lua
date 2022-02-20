local servers = { "pyright", "rust_analyzer", "tsserver", "eslint", "clangd" }
for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup({
    flags = {
      debounce_text_changes = 50,
    },
  })
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("lspconfig")["tsserver"].setup({
  capabilities = capabilities,
})
require("lspconfig")["clangd"].setup({
  capabilities = capabilities,
})

require("user.lsp.null-ls")
