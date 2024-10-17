local conform = require "conform"

local function formatter(bufnr)
  local has_biome = vim.fn.findfile("biome.json", ".;") ~= ""
  if has_biome then
    return { "biome" }
  else
    return { "prettier" }
  end
end

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
    javascript = { "biome", "rustywind" },
    typescript = { "biome", "rustywind" },
    typescriptreact = { "biome", "rustywind" },
    javascriptreact = { "biome", "rustywind" },
    html = { "rustywind" },
    css = { "rustywind" },

    python = { "black" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  format = {
    timeout_ms = 500,
    lsp_fallback = true,
    stop_after_first = true -- This is the new option to replace the nested syntax
  }
}

conform.setup(options)
