return {
  "nvim-mini/mini.diff",
  version = "*",
  lazy = false,
  config = function()
    require("mini.diff").setup()
  end,
}
