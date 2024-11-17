---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require "configs.lsp.index"
    end,
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
  },
}

