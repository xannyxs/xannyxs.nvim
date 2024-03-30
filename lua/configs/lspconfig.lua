local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd", "rust_analyzer", "tsserver",
  "tailwindcss",
  "bashls",
  "pyright",
  "volar",
  "cmake",
  "asm_lsp",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.sigmatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
