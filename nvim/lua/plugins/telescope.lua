return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.1",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  },
  config = function()
    require("telescope").load_extension("ui-select");
    require("telescope").load_extension("fzf");
  end
}
