return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lualine").setup({
      options = {
        theme = "tomorrow_night",
      },
      sections = {
        lualine_b = { "branch" },
        lualine_c = { {
          'filename',
          path = 1
        }, "diff" },
      },
    })
  end,
}
