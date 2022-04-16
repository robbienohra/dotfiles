require("lualine").setup({
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
          -- return str:sub(1, 1):lower()
        end,
      },
    },
    lualine_b = {
      {
        "branch",
        fmt = function(str)
          return str:sub(1, vim.o.columns * 1 / 8)
        end,
      },
    },
    lualine_c = {
      {
        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        path = 1, -- 0: Just the filename
        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
      },
    },
    lualine_x = { "filetype" },
    lualine_y = {},
    lualine_z = { "progress" },
  },
  options = {
    theme = "gruvbox_dark",
    icons_enabled = true,
    fmt = string.lower,
  },
})
