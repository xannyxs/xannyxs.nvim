local conform = require "conform"

local biome_or_prettier = {
  function(bufnr)
    local has_biome = vim.fn.findfile("biome.json", ".;") ~= ""
    if has_biome then
      return "biome"
    else
      return "prettier"
    end
  end,
}

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },

    ["cmake"] = { "cmake_format" },
    asm = { "asmfmt" },

    -- Low-Level
    cpp = { "clang_format" },
    c = { "clang_format" },

    -- Front - End
    javascript = { biome_or_prettier, "rustywind" },
    typescript = { biome_or_prettier, "rustywind" },
    typescriptreact = { biome_or_prettier, "rustywind" },
    javascriptreact = { biome_or_prettier, "rustywind" },
    html = { "rustywind" },
    css = { "rustywind" },

    python = { "black" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

conform.setup(options)
