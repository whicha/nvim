---@type LazySpec
return {
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require "configs.comments"
    end,
  },
}
