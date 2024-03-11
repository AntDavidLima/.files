vim.g.mapleader = " "

vim.keymap.set("n", "<leader>z", vim.cmd.Lazy)

vim.keymap.set("n", "<C-A-k>", ":resize -2<CR>")
vim.keymap.set("n", "<C-A-j>", ":resize +2<CR>")
vim.keymap.set("n", "<C-A-l>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-A-h>", ":vertical resize +2<CR>")

vim.keymap.set("v", "p", '"_dP')
vim.keymap.set("v", "<leader>p", "p")

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
