vim.g.mapleader = " "

-- ---------- NetRW -------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ---------- UI ----------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

-- ---------- Indentation ----------
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- ---------- Search ----------
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- ---------- Editing ----------
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.mouse = "a"

-- ---------- Undo ----------
vim.opt.undofile = true

-- ---------- Splits ----------
vim.opt.splitbelow = true
vim.opt.splitright = true

-- ---------- Performance ----------
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- ---------- Diagnostics ----------
vim.diagnostic.config({
  virtual_text = {
    prefix = "",
    spacing = 2,
    severity = { min = vim.diagnostic.severity.HINT },
    source = "if_many",
  },
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
