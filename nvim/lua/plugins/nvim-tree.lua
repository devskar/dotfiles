return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>" }
  },
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        side = "right"
      }
    })

    -- Close nvim-tree cleanly when quitting Neovim
    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        pcall(vim.cmd, "NvimTreeClose")
      end,
    })
  end,
}
