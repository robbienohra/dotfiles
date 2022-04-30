local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local coq = require("coq") -- add this

require("nvim-lsp-installer").setup()

local lspconfig = require("lspconfig")

local function on_attach(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

lspconfig.tsserver.setup({})

local sumneko_opts = require("user.lsp.settings.sumneko_lua")
lspconfig.sumneko_lua.setup(sumneko_opts)

local eslint_opts = require("user.lsp.settings.eslint")
lspconfig.eslint.setup(eslint_opts)

lspconfig.jsonls.setup({ on_attach = on_attach })
lspconfig.tsserver.setup({ on_attach = on_attach, capabilities = capabilities })

-- lspconfig.vuels.setup(coq.lsp_ensure_capabilities())
lspconfig.vuels.setup({ capabilities = capabilities })

require("user.lsp.null-ls")
require("user.lsp.groovyls")
