vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float({
        bufnr = bufnr,
        scope = "cursor",
        focus = false,
      })
    end,
  },
})

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
vim.keymap.set("n", "<leader>qq", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

vim.keymap.set("n", "gqn", function()
  vim.diagnostic.jump({ count = 1, float = false })
  vim.cmd("normal! zz")
  vim.diagnostic.open_float()
end, { desc = "Goto next diagnostic item" })
vim.keymap.set("n", "gqp", function()
  vim.diagnostic.jump({ count = -1, float = false })
  vim.cmd("normal! zz")
  vim.diagnostic.open_float()
end, { desc = "Goto previous diagnostic item" })
