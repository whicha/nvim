-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- cxx config
require "configs.lsp.cxx"

-- lua config
require "configs.lsp.lua_ls"

-- python config
require "configs.lsp.python"
