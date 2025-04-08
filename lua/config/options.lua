-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.opt.foldcolumn = "0" -- '0' is not bad
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true

vim.opt.timeoutlen = 350
vim.opt.spelllang = "en"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.g.autoformat = true
vim.g.lazyvim_picker = "snacks"

vim.opt.listchars = { space = "∙", tab = "∙∙" }

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
-- Show line diagnostics automatically in hover window
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
-- vim.opt.updatetime = 250
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
--   callback = function ()
--     vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
--   end
-- })
