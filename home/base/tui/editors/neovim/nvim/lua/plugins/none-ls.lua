-- Customize none-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    config.sources = {
      -- Formatting
      formatting.alejandra, -- nix formatter
      formatting.stylua,    -- lua formatter
    }
  end,
}
