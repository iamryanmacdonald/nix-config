-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Diagnostics configuration (for vim.diagnostics.config({ ... })) when diagnostics are on
    diagnostics = {
      underline = true,
      virtual_text = true,
    },
    -- Configure core features of AstroNvim
    features = {
      autopairs = true,                                 -- enable autopairs at start
      cmp = true,                                       -- enable completion at start
      diagnostics_mode = 3,                             -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true,                              -- highlight URLs at start
      large_buf = { lines = 10000, size = 1024 * 500 }, -- set global limmits for large files for disabling features like treesitter
      notifications = true,                             -- enable notifications at start
    },
    -- Mappings can be configured through AstroCore as well.
    -- https://docs.astronvim.com/recipes/mappings/
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized.
    mappings = {
      n = {
        -- mappings seen under the name "Buffer"
        ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },

        -- Terminal
        -- NOTE: https://neovim.io/doc/user/builtin.html#jobstart()
        --  1. If {cmd} is a List it runs directly (no 'shell')
        --  2. If {cmd} is a String it runs in the 'shell'
        -- search and replace globally
        ["<Leader>ss"] = { '<cmd>lua require("spectre").toggle()<cr>', desc = "Toggle Spectre" },
        ["<Leader>sw"] = {
          '<cmd>lua require("spectre").open_visual({ select_word = true })<cr>',
          desc = "Search current word",
        },
        ["<Leader>sp"] = {
          '<cmd>lua require("spectre").open_file_search({ select_word = true })<cr>',
          desc = "Search on current file",
        },

        -- yank history
        ["<Leader>yh"] = {
          function() require("telescope").extensions.yank_history.yank_history() end,
          desc = "Preview yank history",
        },

        -- undo history
        ["<Leader>uh"] = { "<cmd>Telescope undo<cr>", desc = "Telescope undo" },

        -- implementation / definition preview
        ["gpd"] = { '<cmd>lua require("goto-preview").goto_preview_definition()<cr>', desc = "goto_preview_definition" },
        ["gpt"] = {
          '<cmd>lua require("goto-preview").goto_preview_type_definition()<cr>',
          desc = "goto_preview_type_definition",
        },
        ["gpi"] = {
          '<cmd>lua require("goto-preview").goto_preview_implementation()<cr>',
          desc = "goto_preview_implementation",
        },
        ["gP"] = { '<cmd>lua require("goto-preview").close_all_win()<cr>', desc = "close_all_win" },
        ["gpr"] = { '<cmd>lua require("goto-preview").goto_preview_references()<cr>', desc = "goto_preview_references" },
      },
      v = {
        ["<Leader>sw"] = {
          '<esc><cmd>lua require("spectre").open_visual()<cr>',
          desc = "Search current word",
        },
      },
    },
    -- vim options can be configured here
    options = {
      -- vim.opt.<key>
      opt = {
        relativenumber = true, -- show relative numberline
        signcolumn = "auto",   -- show sign column when used only
        smartindent = false,   -- smart indentation
        spell = false,         -- spell checking
        swapfile = false,      -- swapfile
        title = true,          -- set the title of window to `filename [+=-] (path) - NVIM`
        -- The percentage of 'columns' to use for the title.
        -- When the title is longer, only the end of the path name is shown.
        titlelen = 20,
      },
    },
  },
}
