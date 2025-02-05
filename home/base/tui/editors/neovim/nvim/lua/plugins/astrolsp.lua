-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      lsp_document_highlight = {
        cond = "textDocument/documentHighlight",
        {
          callback = function() vim.lsp.buf.document_highlight() end,
          desc = "Document Highlighting",
          event = { "CursorHold", "CursorHoldI" },
        },
        {
          callback = function() vim.lsp.buf.clear_references() end,
          desc = "Document Highlighting Clear",
          event = { "BufLeave", "CursorMoved", "CursorMovedI" },
        },
      },
    },
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true, -- enable or disable auto formatting on start
      codelens = true, -- enable or disable codelens refresh on start
      inlay_hints = true, -- enable or disable inlay hints on start
      semantic_tokens = true, -- enable or disable semantic token highlighting
    },
    -- customize LSP formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        allow_filetypes = {}, -- enable format on save for specified filetypes only
        enabled = true, -- enable or disable format on save globally
        ignore_filetypes = {}, -- disable format on save for specified filetypes
      },
      timeout_ms = 1000, -- default format timeout
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },

        -- refactoring
        ["<Leader>ri"] = {
          function() require("refactoring").refactor "Inline Variable" end,
          desc = "Inverse of extract variable",
        },
        ["<Leader>rb"] = { function() require("refactoring").refactor "Extract Block" end, desc = "Extract Block" },
        ["<Leader>rbf"] = {
          function() require("refactoring").refactor "Extract Block To File" end,
          desc = "Extract Block To File",
        },
        ["<Leader>rr"] = {
          function() require("telescope").extensions.refactoring.refactors() end,
          desc = "Prompt for a refactor to apply",
        },
        ["<Leader>rp"] = {
          function() require("refactoring").debug.printf { below = false } end,
          desc = "Insert print statement to mark the calling of a function",
        },
        ["<Leader>rv"] = {
          function() require("refactoring").debug.print_var() end,
          desc = "Insert print statement to print a variable",
        },
        ["<Leader>rc"] = {
          function() require("refactoring").debug.cleanup {} end,
          desc = "Cleanup of all generated print statements",
        },
      },
      -- visual mode(what's the difference between v and x???)
      x = {
        -- refactoring
        ["<Leader>ri"] = {
          function() require("refactoring").refactor "Inline Variable" end,
          desc = "Inverse of extract variable",
        },
        ["<Leader>re"] = {
          function() require("refactoring").refactor "Extract Function" end,
          desc = "Extracts the selected code to a separate function",
        },
        ["<Leader>rf"] = {
          function() require("refactoring").refactor "Extract Function To File" end,
          desc = "Extract Function To File",
        },
        ["<Leader>rv"] = {
          function() require("refactoring").refactor "Extract Variable" end,
          desc = "Extracts occurrences of a selected expression to its own variable",
        },
        ["<Leader>rr"] = {
          function() require("telescope").extensions.refactoring.refactors() end,
          desc = "Prompt for a refactor to apply",
        },
      },
    },
    -- enable servers that you already have installed without mason
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    servers = {
      ---- Data & Configuration Languages
      "jsonls", -- json
      "marksman", -- markdown
      "nil_ls", -- nix
      "taplo", -- toml
      "yamlls", -- yaml

      ---- General Purpose Languages
      "bashls", -- bash
      "lua_ls", -- lua
      "nushell", -- nushell
    },
  },
}
