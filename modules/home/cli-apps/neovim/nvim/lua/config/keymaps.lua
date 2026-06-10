vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- move visual block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy selection into clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Copy line into clipboard" })
vim.keymap.set("n", "<leader>Y", ":%y+<CR>", { desc = "Copy file into clipboard" })

vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard after cursor" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from clipboard before cursor" })
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste over selection" })

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yank" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })
