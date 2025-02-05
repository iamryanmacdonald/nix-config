-- Customize none-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    config.sources = {
      -- Code Actions
      code_actions.gitsigns,
      code_actions.refactoring,
      code_actions.statix,

      -- Diagnostics
      diagnostics.actionlint, -- GitHub Actions workflow syntax checking
      diagnostics.deadnix, -- scan nix files for dead code

      -- Formatting
      formatting.alejandra, -- nix formatter
      formatting.stylua, -- lua formatter
    }

    return config
  end,
}
