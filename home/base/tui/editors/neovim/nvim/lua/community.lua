-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- @type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Language Support
  ---- Backend / System
  { import = "astrocommunity.pack.lua" },

  -- colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
}
