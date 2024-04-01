local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    c = { "clang_format" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  format_after_save = {
    lsp_fallback = true,
  }

  notify_on_error = true,
}

require("conform").setup(options)
