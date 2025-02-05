-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- @type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- Colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- Editing
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  -- Motion
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.flit-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.motion.nvim-spider" },
  -- Language Support
  ---- Configuration Language
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  ---- Backend / System
  { import = "astrocommunity.pack.lua" },
  ---- Operation & Cloud Native
  { import = "astrocommunity.pack.bash" },
  -- Scrolling
  { import = "astrocommunity.scrolling.nvim-scrollbar" },
}
