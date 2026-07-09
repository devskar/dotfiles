local map = vim.keymap.set
local telescope = require("telescope.builtin")

-- ---- General ----
map("n", "<leader>", "<nop>")
map("n", "<leader>w", vim.cmd.write, { desc = "Save file" })

map("n", "<Enter>", "o<ESC>")
map("n", "<S-Enter>", "O<ESC>")

map("n", "<leader>m", function()
  local wrap = vim.wo.wrap

  vim.wo.wrap = not wrap
  vim.wo.linebreak = not wrap
end, { desc = "Toggle wrap + linebreak" })

-- ---- Telescope ----
map("n", "<leader>ff", function()
  local ok = pcall(telescope.git_files)
  if not ok then
    telescope.find_files()
  end
end, { desc = "Git files / Find files" })
map("n", "<leader>fa", function()
  telescope.find_files()
end, { desc = "Find files" })
map("n", "<leader>fg", function()
  telescope.live_grep()
end, { desc = "Live grep" })
map("n", "<leader>fb", function()
  telescope.buffers()
end, { desc = "Buffers" })
map("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "Help" })
map("n", "<leader>fp", "<cmd>lua require'telescope'.extensions.project.project{}<CR>", { desc = "Projects" })

-- ---- LSP ----
vim.api.nvim_create_autocmd(
  "LspAttach",
  { --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)

      -- Open the diagnostic under the cursor in a float window
      vim.keymap.set("n", "<leader>d", function()
        vim.diagnostic.open_float({
          border = "rounded",
        })
      end, opts)
    end,
  }
)
