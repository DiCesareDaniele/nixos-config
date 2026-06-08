vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selection into clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Copy line into clipboard" })
vim.keymap.set("n", "<leader>Y", ":%y+<CR>", { desc = "Copy file into clipboard" })

vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard after cursor" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from clipboard before cursor" })
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste over selection" })
