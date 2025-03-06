-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- set handler on LspAttach Event
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client ~= nil then
--       client.server_capabilities.semanticTokensProvider = nil
--     end
--   end,
-- })

-- https://www.lazyvim.org/configuration/tips#disable-autoformat-for-some-buffers
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "ts" },
  callback = function()
    vim.b.autoformat = false
  end,
})
