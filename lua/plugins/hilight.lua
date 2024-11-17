---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "configs.treesitter"
    end,
  },

  { -- Sticky scroll
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },
}
