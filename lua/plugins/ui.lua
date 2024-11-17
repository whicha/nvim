---@type LazySpec
return {
  { -- Override `nvim-tree` plugin
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.ui").nvim_tree,
  },
}
