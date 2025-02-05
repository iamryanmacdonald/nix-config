-- File explorer(Custom configs)
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        visible = true, -- visible by default
      },
    },
  },
}
