local orig_handler = vim.lsp.handlers.hover

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(function(_, result, ctx, config)
  local wins_before = vim.api.nvim_list_wins()

  orig_handler(_, result, ctx, config)

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if not vim.tbl_contains(wins_before, win) then
      local cfg = vim.api.nvim_win_get_config(win)
      if cfg.relative ~= "" then
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "" then
          vim.bo[buf].filetype = "markdown"
        end
        break
      end
    end
  end
end, {
  border = "rounded",
})
