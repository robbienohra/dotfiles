local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.terraform_fmt,
    formatting.deno_fmt.with {
      filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
      extra_args = { "--options-line-width=80", "--use-tabs=true" },
    },
    formatting.yamlfmt,
    formatting.prettier.with {
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "less",
        "scss",
        "svelte",
        "typescript",
        "typescriptreact",
        "vue",
        "yaml",
      },
      disabled_filetypes = { "markdown" },
    },
    formatting.stylua.with {
      extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
    },
    diagnostics.tsc,
    formatting.pg_format,
    formatting.shfmt.with {
      filetypes = {
        "sh",
        "zsh",
      },
    },
  },
}
