require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "cpp",
    "cmake",
    "css",
    "dockerfile",
    "go",
    "javascript",
    "json",
    "python",
    "rust",
    "scss",
    "svelte",
    "toml",
    "typescript",
    "vue",
    "yaml",
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
})
