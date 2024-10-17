-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  ---@type HLTable
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
}

-- M.mason = {
--   pkgs = {
--     "lua-language-server",
--     "typescript-language-server",
--     "html-lsp",
--     "prettierd",
--     "eslint_d",
--     "stylua",
--     "biome",
--     "bash-language-server",
--     "tailwindcss-language-server",
--     "css-lsp",
--     "json-lsp",
--     "jsonld-lsp",
--     "rust-analyzer",
--     "yaml-language-server",
--     "vue-language-server",
--     "rustywind",
--     "astro-language-server",
--
--     -- Python
--     "black",
--     "pylint",
--     "pyright",
--     "mypy",
--
--     -- C++
--     "clangd",
--     "clang-format",
--     "codelldb",
--     "cmake-language-server",
--     "cmakelint",
--
--     -- Low-level
--     "asm-lsp",
--     "asmfmt",
--     "checkmake",
--   },
-- }

return M
