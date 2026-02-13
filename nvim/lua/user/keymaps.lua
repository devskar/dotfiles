local map = vim.keymap.set
local telescope = require("telescope.builtin")

-- ---- General ----
map("n", "<leader>", "<nop>")

-- ---- File actions ----
map("n", "<leader>w", "<cmd>w<CR>")  -- save
map("n", "<leader>q", "<cmd>q<CR>")  -- quit
map("n", "<leader>x", "<cmd>wq<CR>") -- save + quit

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    local map_opts = { noremap = true, silent = true }
    vim.keymap.set("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definition()<CR>", map_opts)
    vim.keymap.set("n", "<leader>D", "<cmd>lua require('omnisharp_extended').lsp_type_definition()<CR>", map_opts)
    vim.keymap.set("n", "gr", "<cmd>lua require('omnisharp_extended').lsp_references()<CR>", map_opts)
    vim.keymap.set("n", "gi", "<cmd>lua require('omnisharp_extended').lsp_implementation()<CR>", map_opts)
  end
})

