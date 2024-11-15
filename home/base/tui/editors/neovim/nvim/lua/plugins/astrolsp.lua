-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true,      -- enable or disable auto formatting on start
      codelens = true,        -- enable or disable codelens refresh on start
      inlay_hints = true,     -- enable or disable inlay hints on start
      semantic_tokens = true, -- enable or disable semantic token highlighting
    },
    -- customize LSP formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        allow_filetypes = {},  -- enable format on save for specified filetypes only
        enabled = true,        -- enable or disable format on save globally
        ignore_filetypes = {}, -- disable format on save for specified filetypes
      },
      timeout_ms = 1000,       -- default format timeout
    },
    -- enable servers that you already have installed without mason
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    servers = {
      ---- Data & Configuration Languages
      "nil_ls", -- nix language server

      ---- General Purpose Languages
      "lua_ls", -- lua
    },
  },
}
