local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.clang_format,
    formatting.terraform_fmt,
    formatting.deno_fmt.with {
      filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
      extra_args = { "--options-line-width=100" },
    },
    formatting.yamlfmt,
    formatting.prettier.with {
      disabled_filetypes = { "markdown" },
    },
    formatting.stylua.with {
      extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
    },
    diagnostics.tsc,
    formatting.sql_formatter.with {
      extra_args = { "--language=postgresql" },
    },
    formatting.shfmt.with {
      filetypes = {
        "sh",
        "zsh",
      },
    },
  },
}
