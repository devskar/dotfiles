local function project_filename()
  return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
end

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
        lualine_c = { project_filename },
      },
    })
  end,
}
