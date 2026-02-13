return {
  "folke/tokyonight.nvim",
  lazy = false,      -- load during startup
  priority = 1000,   -- load before other UI plugins
  opts = {
    style = "night", -- night | storm | moon | day
    transparent = false,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
    },
  },
}

