local lspconfig = require "lspconfig"

local servers = { "clangd", "cmake" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)
      if client.supports_method("textDocument/inlayHint", { bufnr = bufnr }) then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
