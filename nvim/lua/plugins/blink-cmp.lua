return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  lazy = false,

  version = "1.*",

  opts = {
    keymap = {
      preset = "default",

      ["<CR>"] = { 'select_and_accept', 'fallback' },
      ["<C><leader>"] = { "show" },
    },

    appearance = {
      nerd_font_variant = "mono"
    },

    completion = { documentation = { auto_show = true } },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
