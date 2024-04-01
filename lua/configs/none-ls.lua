local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  -- Typescript
  formatting.prettierd,
  formatting.stylua,
  -- formatting.eslint_d,
  formatting.rustywind,

  -- Rust
  -- formatting.rustfmt,

  -- CPP
  formatting.clang_format,
  formatting.cmake_format,
  diagnostics.cmake_lint,

  -- Assembly
  formatting.asmfmt,
  diagnostics.checkmake,

  -- Python
  diagnostics.mypy,
  diagnostics.pylint,
  formatting.black,
}

local opts = {
  sources = sources,
  on_attach = function(client, bufnr)
    -- if client.supports_method "textDocument/formatting" then
    --   vim.api.nvim_clear_autocmds {
    --     group = augroup,
    --     buffer = bufnr,
    --   }
    --   vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = augroup,
    --     buffer = bufnr,
    --     callback = function()
    --       vim.lsp.buf.format { bufnr = bufnr }
    --     end,
    --   })
    -- end
  end,
}

return opts
