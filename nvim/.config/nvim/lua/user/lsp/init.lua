local servers = {
  "bashls",
  "clangd",
  "eslint",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "tsserver",
  -- "volar",
  -- "vuels",
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

require("lspconfig").vuels.setup({
  cmd = { "vls" },
  filetypes = { "vue" },
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {},
      },
      javascript = {
        format = {},
      },
      stylusSupremacy = {},
      typescript = {
        format = {},
      },
      vetur = {
        completion = {
          autoImport = false,
          tagCasing = "kebab",
          useScaffoldSnippets = false,
        },
        format = {
          defaultFormatter = {
            js = "none",
            ts = "none",
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false,
        },
        useWorkspaceDependencies = false,
        validation = {
          script = true,
          style = true,
          template = true,
        },
      },
    },
  },
  -- root_dir = util.root_pattern("package.json", "vue.config.js")
})

require("user.lsp.null-ls")
