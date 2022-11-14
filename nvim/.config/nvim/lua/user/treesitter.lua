require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "cpp",
    "cmake",
    "css",
    "dockerfile",
    "go",
    "hcl",
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
  },
}
