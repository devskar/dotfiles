return {
  "mason-org/mason.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true }
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
      ["markdownlint-cli2"] = {},
      ["markdown-toc"] = {},
      marksman = {},
      clangd = {},
      omnisharp = {
        handlers = {
          ["textDocument/definition"] = function(...)
            return require("omnisharp_extended").handler(...)
          end,
        },
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
          },
          MsBuild = {
            LoadProjectsOnDemand = false,
          },
          RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
            AnalyzeOpenDocumentsOnly = false,
            EnableDecompilationSupport = true,
          },
          RenameOptions = {},
          Sdk = { IncludePrereleases = true },
        },
      },
    }
  },
  config = function(_, opts)
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(opts.servers),
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    for server, config in pairs(opts.servers) do
      config.capabilities = capabilities
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end
}
