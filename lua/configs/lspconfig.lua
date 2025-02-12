local configs = require "nvchad.configs.lspconfig"
local util = require "lspconfig.util"

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
}

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.diagnostic.show()
  end,
})

local servers = {
  html = {},
  cssls = {},
  rust_analyzer = {
    filetypes = { "rust", "rs" },
    settings = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },
  biome = {},
  eslint = {},
  ["nil_ls"] = {},
  jsonls = {},
  ts_ls = {},
  bashls = {},
  volar = {},
  cmake = {},
  asm_lsp = {},
  astro = {},
  clangd = {
    on_attach = function(client, bufnr)
      client.server_capabilities.signatureHelpProvider = false
      configs.on_attach(client, bufnr)
    end,
  },
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  },
  ruff = {
    on_attach = function(client, bufnr)
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end,
  },
  tailwindcss = {},
}

local function combine_on_attach(original_on_attach)
  return function(client, bufnr)
    if original_on_attach then
      original_on_attach(client, bufnr)
    end
    require("lsp_signature").on_attach({ bind = true }, bufnr)
  end
end

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = combine_on_attach(opts.on_attach or configs.on_attach)
  opts.capabilities = configs.capabilities
  require("lspconfig")[name].setup(opts)
end
