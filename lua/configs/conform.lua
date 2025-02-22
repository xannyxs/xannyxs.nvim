local conform = require "conform"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },

    -- Low-Level
    cpp = { "clang_format" },
    c = { "clang_format" },
    cmake = { "cmake_format" },
    asm = { "asmfmt" },
    rust = { "rustfmt" },

    -- Front - End
    javascript = { "biome", "rustywind" },
    typescript = { "biome", "rustywind" },
    typescriptreact = { "biome", "rustywind" },
    javascriptreact = { "biome", "rustywind" },
    html = { "rustywind" },
    css = { "rustywind" },

    python = { "black" },
    markdown = { "markdownlint" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  format = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

conform.setup(options)
