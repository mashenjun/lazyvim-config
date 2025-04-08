-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- exit insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
-- save
vim.keymap.set("n", "<C-s>", ":w<CR>")
-- close quick fix windows
vim.keymap.set("n", "<leader>cc", ":cclose<CR>")
vim.keymap.set("n", "<leader>co", ":copen<CR>")
-- disable highlight
vim.keymap.set("n", "<leader>h", ":noh<CR>")
-- helper keybinding
vim.api.nvim_set_keymap("n", "oo", "o<Esc>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "OO", "O<Esc>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })
-- toggle float windows to show diagnostic
vim.api.nvim_set_keymap(
  "n",
  "gl",
  ':lua vim.diagnostic.open_float(nil, {focus=true, scope="cursor"})<CR>',
  { noremap = true, silent = true }
)
