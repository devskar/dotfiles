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
    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.5

    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.o.columns
            local screen_h = vim.o.lines - vim.o.cmdheight

            local window_w = math.floor(screen_w * WIDTH_RATIO)
            local window_h = math.floor(screen_h * HEIGHT_RATIO)

            local center_x = (screen_w - window_w) / 2
            local center_y = (vim.o.lines - window_h) / 2 - vim.o.cmdheight

            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w,
              height = window_h,
            }
          end,
        },

        width = function()
          return math.floor(vim.o.columns * WIDTH_RATIO)
        end,
      },
    })

    -- Close nvim-tree cleanly when quitting Neovim
    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        pcall(vim.cmd, "NvimTreeClose")
      end,
    })
  end,
}
