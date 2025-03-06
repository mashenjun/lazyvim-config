if vim.g.vscode then
  return {}
end

return {
  -- themes related
  {
    "neanias/everforest-nvim",
    version = false,
    enabled = true,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- optional; default configuration will be used if setup isn't called.
    -- config = function()
    --   require("everforest").setup({
    --     background = "hard",
    --     disable_italic_comments = true,
    --     italics = false,
    --     colours_override = function(palette)
    --       palette.bg1 = "#39454a"
    --     end,
    --   })
    -- end,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = false
    end,
  },
  {
    "blazkowolf/gruber-darker.nvim",
    opts = {
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
    },
  },
  -- {
  --   "thimc/gruber-darker.nvim",
  --   config = function()
  --     require("gruber-darker").setup({
  --       transparent = true, -- removes the background
  --       -- underline = false, -- disables underline fonts
  --       -- bold = false, -- disables bold fonts
  --     })
  --   end,
  -- },
  -- themes related end
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
      -- colorscheme = "gruber-darker",
    },
  },
}
