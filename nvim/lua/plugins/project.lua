return {
  "ahmedkhalf/project.nvim",
  lazy = false,
  config = function()
    require("project_nvim").setup({
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "go.mod", "*.sln", "*.slnx" },
      show_hidden = false,
      sync_root_with_cwd = true,
    })
  end,
}
