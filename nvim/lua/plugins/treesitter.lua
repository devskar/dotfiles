return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "lua", "javascript", "html", "c_sharp", "markdown" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true
    })
  end
}
