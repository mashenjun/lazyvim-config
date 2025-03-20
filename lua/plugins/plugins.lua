if vim.g.vscode then
  return {}
end

return {
  { "tpope/vim-abolish" },
  {
    "kylechui/nvim-surround",
    version = "*", -- use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  -- disable snacks indent when indent-blankline is enabled.
  -- make the UI less distractive.
  {
    "snacks.nvim",
    opts = {
      indent = {
        enabled = true,
        only_scope = false, -- only show indent guides of the scope
        only_current = false, -- only show indent guides in the current window
      },
      animate = { enabled = false },
      scroll = { enabled = false },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = {
        char = "∙",
        tab_char = "∙",
      },
    },
  },
  { "kana/vim-textobj-user" },
  {
    "kana/vim-textobj-entire",
    dependencies = { "kana/vim-textobj-user" },
  },
  {
    "andymass/vim-matchup",
    enabled = true,
    version = "*",
    -- commit = "6c8909b682803d8c3a054259079f158a73a0e30f",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  { "tpope/vim-repeat" },
  {
    "ethanholz/nvim-lastplace",
    event = "bufread",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "crispgm/nvim-go",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "go" },
    config = function()
      require("go").setup({
        -- we only need the commands such as `:goaddtags`, `:goremovetags`
        auto_format = false,
        auto_lint = false,
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "bufread",
    config = function()
      require("lsp_signature").setup({
        hint_enable = true,
        floating_window = false,
        hint_prefix = " ",
        -- hint_prefix = "󰍉 ",
      })
    end,
  },
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "bufread",
    config = function()
      require("lsp-rooter").setup()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" },
    -- build = "yay -s glow"
  },
  {
    "folke/lsp-colors.nvim",
    event = "bufread",
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        width = 120, -- width of the floating window
        height = 25, -- height of the floating window
        default_mappings = true, -- bind default mappings
        debug = false, -- print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil, -- a function taking two arguments, a buffer and a window to be ran as a hook.
        -- you can use "default_mappings = true" setup option
        -- or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<cr>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<cr>")
        -- vim.cmd("nnoremap gp <cmd>lua require('goto-preview').close_all_win()<cr>")
      })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "bufread", "bufnew" },
    config = function()
      require("bqf").setup({
        magic_window = true,
        auto_enable = true,
        auto_resize_height = true,
        preview = {
          win_height = 20,
          win_vheight = 15,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true, -- enable this plugin (can be enabled/disabled later via commands)
        throttle = true, -- throttles plugin updates (may improve performance)
        max_lines = 1, -- how many lines the window should span. values <= 0 mean no limit.
        patterns = { -- match patterns for ts nodes. these get wrapped to match at word boundaries.
          -- for all filetypes
          -- note that setting an entry here replaces all other patterns for this entry.
          -- by setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            "class",
            "function",
            "method",
          },
        },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
      highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "",
      },
      search = {
        pattern = [[\b(KEYWORDS)(\(shenjun\))?:]],
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({})
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
  },
  -- {
  --   "crusj/bookmarks.nvim",
  --   enabled = false,
  --   branch = "main",
  --   dependencies = { "nvim-web-devicons" },
  --   event = "vimenter",
  --   config = function()
  --     require("bookmarks").setup({
  --       keymap = {
  --         toggle = "<leader><F3>",
  --         add = "<F3>",
  --         delete = "dd",
  --         delete_on_virt = "<F3>d", -- delete bookmark at virt text line
  --       },
  --     })
  --     require("telescope").load_extension("bookmarks")
  --   end,
  -- },
  {
    "echasnovski/mini.splitjoin",
    version = "*",
    config = function()
      require("mini.splitjoin").setup()
    end,
  },
  {
    "echasnovski/mini.trailspace",
    version = "*",
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      require("gitblame").setup({
        enabled = false,
      })
    end,
  },
  {
    "echasnovski/mini.move",
    version = "*",
    config = function()
      if vim.loop.os_uname().sysname == "Darwin" then
        -- https://www.reddit.com/r/vim/comments/qwqygt/vim_seems_to_ignore_meta_key_mappings/
        require("mini.move").setup({
          mappings = {
            -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
            left = "˙",
            right = "¬",
            down = "∆",
            up = "˚",
            -- Move current line in Normal mode
            line_left = "˙",
            line_right = "¬",
            line_down = "∆",
            line_up = "˚",
          },
        })
      else
        require("mini.move").setup()
      end
    end,
  },
  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require("smoothcursor").setup({
        autostart = false,
        fancy = {
          head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
          body = {
            { cursor = "󰝥", texthl = "SmoothCursorGreen" },
            { cursor = "󰝥", texthl = "SmoothCursorGreen" },
            { cursor = "●", texthl = "SmoothCursorGreen" },
            { cursor = "●", texthl = "SmoothCursorGreen" },
            { cursor = "•", texthl = "SmoothCursorGreen" },
            { cursor = ".", texthl = "SmoothCursorGreen" },
            { cursor = ".", texthl = "SmoothCursorGreen" },
          },
          tail = { cursor = nil, texthl = "SmoothCursor" }, -- false to disable fancy tail
        },
      })
    end,
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({})
    end,
  },
  {
    "echasnovski/mini.bracketed",
    version = "*",
    config = function()
      require("mini.bracketed").setup({
        buffer = { suffix = "b", options = {} },
        comment = { suffix = "c", options = {} },
        conflict = { suffix = "x", options = {} },
        diagnostic = { suffix = "d", options = {} },
        file = { suffix = "f", options = {} },
        indent = { suffix = "i", options = {} },
        jump = { suffix = "j", options = {} },
        location = { suffix = "l", options = {} },
        oldfile = { suffix = "o", options = {} },
        quickfix = { suffix = "q", options = {} },
        treesitter = { suffix = "t", options = {} },
        undo = { suffix = "", options = {} },
        window = { suffix = "w", options = {} },
        yank = { suffix = "y", options = {} },
      })
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = { "BufReadPost", "InsertEnter" },
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },

    init = function()
      vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.opt.foldcolumn = "0" -- '0' is not bad
      vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true
    end,
    config = function(_, opts)
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local totalLines = vim.api.nvim_buf_line_count(0)
        local foldedLines = endLnum - lnum
        local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
        suffix = (" "):rep(rAlignAppndx) .. suffix
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end
      opts["fold_virt_text_handler"] = handler
      require("ufo").setup(opts)
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "d76a8b6e1b67fd3bcffec4a5d45fd9dee4dbbee8",
    -- version = "v0.9.2", -- https://github.com/andymass/vim-matchup/issues/335
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "go",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = { section_separators = "", component_separators = "" },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".DS_Store",
          },
          never_show = {},
        },
      },
    },
  },
  {
    "nvim-lspconfig",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root(), position = "left" })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd(), position = "left" })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>pe",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            -- vim.fn.fnamemodify(vim.fn.findfile("go.mod", ".;"),":h")
            dir = vim.fn.expand("%:p:h:h"),
            reveal_force_cwd = true,
            position = "left",
          })
        end,
        desc = "Explorer NeoTree (package out of cwd)",
      },
    },
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
        gopls = {
          gofumpt = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
          formatTool = "gofmt", -- replace goimports with gofmt
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
  {
    "saghen/blink.cmp",
    opts = {
      fuzzy = {
        prebuilt_binaries = {
          download = true,
          -- Ignores mismatched version between the built binary and the current git sha, when building locally
          ignore_version_mismatch = true,
        },
      },
    },
  },
  -- {
  --   "stevearc/conform.nvim",
  --   -- Command to toggle format-on-save
  --   init = function()
  --     require("conform").setup({
  --       format_on_save = function(bufnr)
  --         -- Disable with a global or buffer-local variable
  --         if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
  --           return
  --         end
  --         return { timeout_ms = 500, lsp_format = "fallback" }
  --       end,
  --     })
  --
  --     vim.api.nvim_create_user_command("FormatDisable", function(args)
  --       if args.bang then
  --         -- FormatDisable! will disable formatting just for this buffer
  --         vim.b.disable_autoformat = true
  --       else
  --         vim.g.disable_autoformat = true
  --       end
  --     end, {
  --       desc = "Disable autoformat-on-save",
  --       bang = true,
  --     })
  --     vim.api.nvim_create_user_command("FormatEnable", function()
  --       vim.b.disable_autoformat = false
  --       vim.g.disable_autoformat = false
  --     end, {
  --       desc = "Re-enable autoformat-on-save",
  --     })
  --   end,
  -- },
  {
    -- enable open file with <file_name>:<line_number>
    "triarius/fileline.nvim",
    opts = {
      copy = {
        destination_register = ":",
      },
    },
  },
  -- https://www.lazyvim.org/configuration/recipes#supertab
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = { command_palette = false },
      cmdline = { enabled = true, view = "cmdline" },
    },
  },
  -- { "echasnovski/mini.comment", enabled = false, version = "*" },
  -- { "tenxsoydev/karen-yank.nvim", config = true },
}
