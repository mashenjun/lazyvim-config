if vim.g.vscode then
  return {}
end

local root_patterns = { "go.mod", ".git", ".clang-format", "pyproject.toml", "setup.py" }
local neotreekeymap = {
  {
    "<leader>pe",
    function()
      require("neo-tree.command").execute({
        toggle = true,
        -- vim.fn.fnamemodify(vim.fn.findfile("go.mod", ".;"),":h")
        -- dir = vim.fn.expand("%:p:h:h"),
        dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1]),
        reveal_force_cwd = true,
        position = "left",
      })
    end,
    desc = "Explorer NeoTree (package root)",
  },
}

local M = {
  {
    "nvim-lspconfig",
    keys = vim.list_contains(LazyVim.config.json.data.extras, "lazyvim.plugins.extras.editor.snacks_explorer") and {}
      or neotreekeymap,
    opts = {
      autoformat = false,
      diagnostics = {
        virtual_text = {
          severity = vim.diagnostic.severity.ERROR,
        },
      },
      inlay_hints = {
        enabled = false,
      },
      servers = {
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
        },
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
          on_attach = function(client, bufnr)
            -- disable the gopls Semantic Tokens highlight.
            -- just use the treesitter's highlight.
            if vim.g.colors_name == "everforest" then
              client.server_capabilities.semanticTokensProvider = nil
            end
          end,
        },
      },
    },
  },
}

return M
