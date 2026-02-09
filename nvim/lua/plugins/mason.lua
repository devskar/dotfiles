return {
  "mason-org/mason.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      ts_ls = {},
      eslint = {},
      tailwindcss = {},
      clangd = {},
      -- "clang-format" = {},
      csharp_ls = {},
    }
  },
  config = function(_, opts)
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(opts.servers),
    })

    for server, config in pairs(opts.servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end
}
