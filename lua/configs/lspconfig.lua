local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  cssls = {},
  rust_analyzer = {},
  tsserver = {},
  tailwindcss = {},
  bashls = {},
  pyright = {},
  volar = {},
  cmake = {},
  asm_lsp = {},

  clangd = {
    on_attach = function(client, bufnr)
      client.server_capabilities.signatureHelpProvider = false
      configs.on_attach(client, bufnr)
    end,
  },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = opts.on_attach or configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
